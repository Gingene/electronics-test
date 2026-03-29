## ADDED Requirements

### Requirement: Browsing history tracking
The system SHALL track the products a user has viewed, storing the product IDs and categories in localStorage.

#### Scenario: Recording a product view
- **WHEN** user visits a product detail page
- **THEN** the product ID, category, rarity, game, and tags SHALL be recorded in the browsing history
- **THEN** the browsing history SHALL retain the most recent 50 entries

### Requirement: Tag-based recommendation (Phase 1)
The system SHALL recommend products based on matching tags from the user's browsing history using a client-side algorithm.

#### Scenario: Generating recommendations from history
- **WHEN** user has browsing history with products tagged "fire", "legendary", "RPG"
- **THEN** the system SHALL recommend other products that share the most common tags
- **THEN** the recommendations SHALL exclude products already in the browsing history

#### Scenario: No browsing history
- **WHEN** user has no browsing history
- **THEN** the system SHALL fall back to displaying featured/popular products

### Requirement: Recommendation display on homepage
The homepage SHALL include a "Recommended for You" section showing 4-8 recommended products in a horizontal carousel.

#### Scenario: Displaying recommendations
- **WHEN** user visits the homepage with existing browsing history
- **THEN** a "Recommended for You" section SHALL be displayed with personalized product cards

#### Scenario: First-time visitor
- **WHEN** user visits the homepage for the first time (no history)
- **THEN** the section SHALL display "Popular Items" with featured products instead

### Requirement: Related products on detail page
The product detail page SHALL include a "You May Also Like" section showing 4 related products.

#### Scenario: Related products shown
- **WHEN** user views a product detail page
- **THEN** 4 products sharing similar tags, category, or game SHALL be displayed below the product details

### Requirement: Recommendation algorithm extensibility (Phase 2 preparation)
The recommendation logic SHALL be encapsulated in a dedicated module with a clear interface, enabling future migration to Supabase Edge Functions without changing the component layer.

#### Scenario: Swapping recommendation engine
- **WHEN** the recommendation module is replaced with a server-side implementation
- **THEN** the component consuming recommendations SHALL NOT need to change
- **THEN** only the data-fetching layer SHALL be modified
