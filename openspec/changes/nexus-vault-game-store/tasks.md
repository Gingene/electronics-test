## 1. Project Setup & Infrastructure

- [x] 1.1 Initialize Next.js 15 project with App Router, TypeScript, and Tailwind CSS v4
- [x] 1.2 Install and configure shadcn/ui (dark theme default)
- [x] 1.3 Set up Supabase client library (`@supabase/supabase-js`, `@supabase/ssr`)
- [x] 1.4 Configure environment variables for Supabase (URL, anon key)
- [x] 1.5 Set up project directory structure as defined in design.md
- [x] 1.6 Configure design system tokens: color palette (dark sci-fi theme), rarity colors, typography (Google Fonts: Inter/Outfit), spacing

## 2. Database & Seed Data

- [x] 2.1 Create Supabase database tables: products, profiles, orders, order_items
- [x] 2.2 Set up Row Level Security (RLS) policies for all tables
- [x] 2.3 AI-generate 50+ game virtual goods seed data (weapons, armor, skins, gems, cards, estates) with names, descriptions, prices, rarity distribution, tags, and game origins
- [x] 2.4 Create seed script to populate Supabase with generated product data
- [x] 2.5 Set up Supabase Storage bucket for product images and upload placeholder images

## 3. Layout & Navigation

- [ ] 3.1 Create root layout with dark theme, Google Fonts, and global styles
- [ ] 3.2 Build Header component with logo, navigation links, cart icon (with badge), and auth-aware user menu
- [ ] 3.3 Build Footer component
- [ ] 3.4 Implement mobile responsive hamburger menu
- [ ] 3.5 Add cart icon badge showing total item count from Zustand store

## 4. Product Catalog (product-catalog spec)

- [ ] 4.1 Create TypeScript types for Product, Category, Rarity
- [ ] 4.2 Build ProductCard component with rarity-colored border/glow, glassmorphism effect, price, and hover animation
- [ ] 4.3 Build ProductGrid component with responsive layout (1/2/3-4 columns)
- [ ] 4.4 Build RarityBadge component with tier-specific colors and Legendary glow effect
- [ ] 4.5 Create product listing page (`/products`) with server-side data fetching from Supabase
- [ ] 4.6 Implement category filter (weapons, armor, skins, gems, cards, estates)
- [ ] 4.7 Implement rarity filter (multi-select: Common, Uncommon, Rare, Epic, Legendary)
- [ ] 4.8 Implement search functionality (name, description, game name matching)
- [ ] 4.9 Implement sort options (price asc/desc, newest, name A-Z)
- [ ] 4.10 Create product detail page (`/products/[id]`) with large image, full description, rarity glow, game info, tags, stock display, and Add to Cart button

## 5. Shopping Cart (shopping-cart spec)

- [ ] 5.1 Set up Zustand store for cart state with `persist` middleware (localStorage)
- [ ] 5.2 Implement cart actions: addItem, removeItem, updateQuantity, clearCart, getTotal
- [ ] 5.3 Build CartDrawer component (slide-out from right side)
- [ ] 5.4 Build CartItem component with quantity controls (+/-), remove button, and subtotal
- [ ] 5.5 Add toast notifications for "added to cart" feedback
- [ ] 5.6 Implement stock-aware add-to-cart (prevent exceeding available stock)

## 6. Checkout Flow (shopping-cart spec)

- [ ] 6.1 Create checkout page (`/checkout`) with order summary and simulated shipping form
- [ ] 6.2 Implement protected route logic (redirect to login if unauthenticated)
- [ ] 6.3 Build order confirmation page with order details and success animation
- [ ] 6.4 Clear cart after successful checkout
- [ ] 6.5 Prevent access to checkout with empty cart

## 7. Real-time Inventory (realtime-inventory spec)

- [ ] 7.1 Create custom hook `useRealtimeStock` that subscribes to product stock changes via Supabase Realtime
- [ ] 7.2 Integrate real-time stock display on product detail page
- [ ] 7.3 Implement low stock warning (pulsing "Only X left!" for stock ≤ 5)
- [ ] 7.4 Implement out-of-stock handling: disabled button, "Sold Out" overlay on product card
- [ ] 7.5 Ensure proper cleanup of Realtime subscriptions on component unmount

## 8. AI Recommendation System - Phase 1 (ai-recommendation spec)

- [ ] 8.1 Create browsing history tracking module (localStorage, max 50 entries)
- [ ] 8.2 Implement tag-based recommendation algorithm (client-side matching)
- [ ] 8.3 Create recommendation service interface (for future Phase 2 swap)
- [ ] 8.4 Build RecommendationCarousel component for homepage "Recommended for You" section
- [ ] 8.5 Implement fallback to featured/popular products for new visitors
- [ ] 8.6 Add "You May Also Like" section on product detail page (4 related products)

## 9. User Authentication (user-auth spec)

- [ ] 9.1 Set up Supabase Auth configuration and middleware for session management
- [ ] 9.2 Create login page (`/auth/login`) with email/password form
- [ ] 9.3 Create registration page (`/auth/register`) with email/password form and profile creation
- [ ] 9.4 Implement auth-aware Header navigation (guest vs. authenticated state)
- [ ] 9.5 Create auth context/hook for client-side auth state
- [ ] 9.6 Implement logout functionality
- [ ] 9.7 Add redirect-after-login for protected routes

## 10. Homepage & Landing

- [ ] 10.1 Build hero section with animated background (sci-fi/cyberpunk aesthetic)
- [ ] 10.2 Build featured products carousel/grid
- [ ] 10.3 Integrate AI recommendation section ("Recommended for You")
- [ ] 10.4 Build category quick-access cards with hover effects
- [ ] 10.5 Add scroll-triggered animations for homepage sections

## 11. UI Polish & Animations

- [ ] 11.1 Implement glassmorphism card effects across all product cards
- [ ] 11.2 Add hover animations (card lift, glow intensify, scale)
- [ ] 11.3 Add page transition animations
- [ ] 11.4 Add skeleton loading states for product grid and detail page
- [ ] 11.5 Ensure WCAG AA color contrast across all dark theme elements
- [ ] 11.6 Responsive design testing and fixes across mobile/tablet/desktop breakpoints

## 12. Deployment & Documentation

- [ ] 12.1 Configure Vercel deployment with environment variables
- [ ] 12.2 Write README.md with project overview, tech stack, setup instructions, and screenshots
- [ ] 12.3 Add meta tags (title, description, OG tags) for SEO basics
- [ ] 12.4 Final cross-browser testing and bug fixes
