export default function Home({}) {
  return null
}

export async function getServerSideProps({ res }) {
  res.statusCode = 401
  res.setHeader('Content-Type', 'application/json')
  res.end(JSON.stringify({ error: 'Unauthorized' }))
  return { props: {} }
}
