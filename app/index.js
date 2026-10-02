const express = require('express')
const app = express()

app.use(express.json())

// in-memory items list
// no database needed for this practice
let items = [
  { id: 1, name: 'Pizza', price: 12.99 },
  { id: 2, name: 'Burger', price: 8.99 },
  { id: 3, name: 'Pasta', price: 10.99 }
]

// root route
app.get('/', (req, res) => {
  res.json({
    message: 'DevOps Capstone API is running',
    version: '1.0.0'
  })
})

// health check route
// this is what ELB and Docker health checks ping
app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString()
  })
})

// get all items
app.get('/items', (req, res) => {
  res.json({
    count: items.length,
    items: items
  })
})

// add new item
app.post('/items', (req, res) => {
  const { name, price } = req.body

  if (!name || !price) {
    return res.status(400).json({
      error: 'name and price are required'
    })
  }

  const newItem = {
    id: items.length + 1,
    name,
    price
  }

  items.push(newItem)

  res.status(201).json({
    message: 'item added successfully',
    item: newItem
  })
})

const PORT = process.env.PORT || 3000

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})