export type Rarity = 'Common' | 'Uncommon' | 'Rare' | 'Epic' | 'Legendary'

export type Category = 'weapons' | 'armor' | 'skins' | 'gems' | 'cards' | 'estates'

export interface Product {
  id: string
  name: string
  description: string
  price: number
  category: Category
  rarity: Rarity
  game: string
  image_url: string
  stock: number
  tags: string[]
  featured: boolean
  created_at: string
}

export interface CartItem {
  product: Product
  quantity: number
}

export interface Profile {
  id: string
  username: string
  avatar_url: string | null
  browse_history: string[]
}

export interface Order {
  id: string
  user_id: string
  status: 'pending' | 'completed' | 'cancelled'
  total: number
  created_at: string
}

export interface OrderItem {
  id: string
  order_id: string
  product_id: string
  quantity: number
  price: number
}
