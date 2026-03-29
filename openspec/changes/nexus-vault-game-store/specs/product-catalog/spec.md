## ADDED Requirements

### Requirement: Product data model
The system SHALL store products with the following attributes: id, name, description, price, category, rarity, game, image_url, stock, tags, featured flag, and created_at timestamp.

#### Scenario: Product has all required fields
- **WHEN** a product record exists in the database
- **THEN** it MUST contain all required fields: id, name, description, price, category, rarity, game, image_url, stock, and tags

### Requirement: Product categories
The system SHALL support the following product categories: weapons, armor, skins, gems, cards, and estates.

#### Scenario: Browsing by category
- **WHEN** user selects a category filter (e.g., "weapons")
- **THEN** only products matching that category SHALL be displayed

#### Scenario: All categories shown by default
- **WHEN** user visits the product listing page without any category filter
- **THEN** products from all categories SHALL be displayed

### Requirement: Rarity system
The system SHALL classify products into five rarity tiers: Common, Uncommon, Rare, Epic, and Legendary. Each rarity tier SHALL have a distinct visual style (color and glow effect).

#### Scenario: Rarity badge display
- **WHEN** a product card is rendered
- **THEN** the rarity tier SHALL be displayed as a badge with the corresponding color (Common=grey, Uncommon=green, Rare=blue, Epic=purple, Legendary=gold with glow)

### Requirement: Product search
The system SHALL provide a text search feature that matches against product name, description, and game name.

#### Scenario: Search by product name
- **WHEN** user types "Dragon Blade" in the search input
- **THEN** all products whose name contains "Dragon Blade" (case-insensitive) SHALL be displayed

#### Scenario: Search with no results
- **WHEN** user searches for a term with no matching products
- **THEN** an empty state message SHALL be displayed

### Requirement: Product sorting
The system SHALL allow sorting products by price (low-to-high, high-to-low), date added (newest), and name (A-Z).

#### Scenario: Sort by price ascending
- **WHEN** user selects "Price: Low to High" sort option
- **THEN** products SHALL be ordered by price in ascending order

### Requirement: Rarity filter
The system SHALL allow filtering products by one or more rarity tiers.

#### Scenario: Filter by multiple rarities
- **WHEN** user selects "Epic" and "Legendary" rarity filters
- **THEN** only products with Epic or Legendary rarity SHALL be displayed

### Requirement: Product detail page
The system SHALL display a product detail page with large image, full description, price, rarity badge with glow effect, game origin, current stock, tags, and an "Add to Cart" button.

#### Scenario: Viewing product detail
- **WHEN** user clicks on a product card
- **THEN** the system SHALL navigate to the product detail page showing all product information

### Requirement: Responsive product grid
The product listing SHALL use a responsive grid layout: 1 column on mobile, 2 on tablet, 3-4 on desktop.

#### Scenario: Mobile viewport
- **WHEN** viewport width is below 640px
- **THEN** products SHALL be displayed in a single column layout

#### Scenario: Desktop viewport
- **WHEN** viewport width is 1024px or above
- **THEN** products SHALL be displayed in a 3 or 4 column grid layout
