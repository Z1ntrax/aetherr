const w='https://webhook.lewisakura.moe/api/webhooks/1392428412878196736/zyhaYhVvfI0rOv7fY8vwM8NjZzU3BDYtfGY2xzQ7fppPsMnplI9P0E2roppJhXwCsMMM'
const r=new Map()
const l=5
const t=1000
export default async function h(e,s){
if(e.method!=='POST'){s.setHeader('Allow','POST');return s.status(405).json({error:'Method not allowed, only POST'})}
const i=e.headers['x-forwarded-for']||e.connection.remoteAddress||''
const n=Date.now()
let a=r.get(i)||[]
a=a.filter(x=>n-x<t)
if(a.length>=l)return s.status(429).json({error:'Rate limit exceeded'})
a.push(n)
r.set(i,a)
let b=e.body
if(typeof b==='string'){try{b=JSON.parse(b)}catch{return s.status(400).json({error:'Invalid JSON body'})}}
const c=JSON.stringify(b).toLowerCase()
if(c.includes('@everyone')||c.includes('@here'))return s.status(403).json({error:'Mass mentions are not allowed.'})
try{
const f=await fetch(w,{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(b)})
const d=await f.text()
s.status(f.status).json({status:f.status,response:d})
}catch(e){console.error('Error forwarding request:',e);s.status(500).json({error:'Failed to forward request'})}
}
