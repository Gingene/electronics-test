## ADDED Requirements

### Requirement: Real-time stock display
The system SHALL display the current stock count for each product, updated in real-time via Supabase Realtime subscriptions.

#### Scenario: Stock count shown on product detail
- **WHEN** user views a product detail page
- **THEN** the current stock count SHALL be displayed
- **THEN** the stock count SHALL update automatically when it changes in the database (without page refresh)

#### Scenario: Stock count shown on product card
- **WHEN** user views the product listing page
- **THEN** each product card SHALL display an indicator when stock is low (≤ 5 items)

### Requirement: Low stock warning
The system SHALL display a visual warning when a product's stock is low (≤ 5 items remaining).

#### Scenario: Low stock visual indicator
- **WHEN** a product has 5 or fewer items in stock
- **THEN** a pulsing animation or warning badge saying "Only X left!" SHALL be displayed

#### Scenario: Normal stock level
- **WHEN** a product has more than 5 items in stock
- **THEN** no special stock warning SHALL be displayed

### Requirement: Out of stock handling
The system SHALL prevent users from adding out-of-stock products to the cart.

#### Scenario: Product is out of stock
- **WHEN** a product's stock reaches 0
- **THEN** the "Add to Cart" button SHALL be disabled
- **THEN** the button text SHALL change to "Out of Stock"
- **THEN** the product card SHALL display a visual "Sold Out" overlay

### Requirement: Real-time subscription management
The system SHALL properly manage Supabase Realtime channel subscriptions to prevent memory leaks.

#### Scenario: Subscribing on mount
- **WHEN** a component that displays inventory mounts
- **THEN** it SHALL create a Supabase Realtime subscription for the relevant product(s)

#### Scenario: Unsubscribing on unmount
- **WHEN** a component with an active inventory subscription unmounts
- **THEN** it SHALL unsubscribe from the Realtime channel

### Requirement: Stock validates against cart quantity
The system SHALL prevent adding more items to the cart than currently available in stock.

#### Scenario: Adding exceeds stock
- **WHEN** user tries to add a product to cart but cart quantity would exceed stock
- **THEN** the system SHALL show a warning message "Only X items available"
- **THEN** the quantity SHALL NOT exceed the current stock
