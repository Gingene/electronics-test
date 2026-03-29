# Database Setup Instructions

This document explains how to set up the Supabase database for Nexus Vault.

## Prerequisites

1. Create a Supabase project at [supabase.com](https://supabase.com)
2. Get your project URL and keys from Project Settings > API

## Setup Steps

### 1. Configure Environment Variables

Copy `.env.example` to `.env.local` and fill in your Supabase credentials:

```bash
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

### 2. Run Database Migration

Go to your Supabase Dashboard > SQL Editor and run:

```sql
-- Copy and paste contents of: supabase/migrations/20260329_init_schema.sql
```

This will create all the necessary tables:
- `products` - Virtual goods catalog
- `profiles` - User profiles
- `orders` - Purchase orders
- `order_items` - Items in orders

### 3. Populate with Seed Data

In the same SQL Editor, run:

```sql
-- Copy and paste contents of: supabase/seed.sql
```

This will add 60+ diverse virtual items across all categories.

### 4. Set Up Storage (Optional)

For product images:

1. Go to Storage in Supabase Dashboard
2. Create a new bucket named `product-images`
3. Set it to public
4. Update RLS policies if needed

## Database Schema

### Products Table
- Stores all virtual goods
- Categories: weapons, armor, skins, gems, cards, estates
- Rarity levels: Common, Uncommon, Rare, Epic, Legendary
- Realtime enabled for stock updates

### Profiles Table
- Extends auth.users
- Stores username, avatar, browse history
- Auto-created when user signs up

### Orders & Order Items
- Track user purchases
- Protected by RLS (users can only see their own)

## Testing the Setup

Run this in the SQL Editor to verify:

```sql
SELECT category, rarity, COUNT(*) as count
FROM products
GROUP BY category, rarity
ORDER BY category, rarity;
```

You should see items distributed across all categories and rarities.

## Troubleshooting

**Error: relation "products" does not exist**
- Make sure you ran the migration script first

**Error: permission denied**
- Check that RLS policies were created properly
- Verify you're using the correct Supabase project

**No data showing up**
- Confirm the seed script ran successfully
- Check the products table in Supabase Dashboard > Table Editor
