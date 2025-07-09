const r = new Map()
const l = 5
const t = 1000

export default async function h(e, s) {
  if (e.method !== 'POST') {
    s.setHeader('Allow', 'POST')
    return s.status(401).json({ error: 'Unauthorized' })
  }

  const i = e.headers['x-forwarded-for'] || e.connection.remoteAddress || ''
  const n = Date.now()
  let a = r.get(i) || []
  a = a.filter(x => n - x < t)
  if (a.length >= l) return s.status(429).json({ error: 'Rate limit exceeded' })
  a.push(n)
  r.set(i, a)

  let b = e.body
  if (typeof b === 'string') {
    try {
      b = JSON.parse(b)
    } catch {
      return s.status(400).json({ error: 'Invalid JSON body' })
    }
  }

  const c = JSON.stringify(b).toLowerCase()
  if (c.includes('@everyone') || c.includes('@here')) return s.status(403).json({ error: 'Mass mentions are not allowed.' })

  return s.status(200).json({ message: 'Webhook API root endpoint OK' })
}
