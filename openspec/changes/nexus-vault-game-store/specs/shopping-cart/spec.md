## ADDED Requirements

### Requirement: Add to cart
The system SHALL allow users to add products to a shopping cart from both the product listing page and the product detail page.

#### Scenario: Adding a product from product card
- **WHEN** user clicks the "Add to Cart" button on a product card
- **THEN** the product SHALL be added to the cart with quantity 1
- **THEN** a visual confirmation (toast notification or cart icon animation) SHALL be displayed

#### Scenario: Adding a product already in cart
- **WHEN** user adds a product that is already in the cart
- **THEN** the quantity of that product in the cart SHALL be incremented by 1

### Requirement: Cart persistence
The shopping cart state SHALL be persisted in localStorage so that cart contents survive page refreshes and browser restarts.

#### Scenario: Cart survives page refresh
- **WHEN** user has items in the cart and refreshes the page
- **THEN** the cart SHALL still contain the same items with the same quantities

### Requirement: Cart quantity management
The system SHALL allow users to adjust the quantity of items in the cart or remove them entirely.

#### Scenario: Increase item quantity
- **WHEN** user clicks the "+" button on a cart item
- **THEN** the quantity SHALL increase by 1

#### Scenario: Decrease item quantity to zero
- **WHEN** user clicks the "-" button on a cart item with quantity 1
- **THEN** the item SHALL be removed from the cart

#### Scenario: Remove item
- **WHEN** user clicks the "Remove" button on a cart item
- **THEN** the item SHALL be removed from the cart regardless of quantity

### Requirement: Cart total calculation
The system SHALL display the total price of all items in the cart, updated in real-time when quantities change.

#### Scenario: Cart total reflects quantities
- **WHEN** cart contains 2x "Dragon Blade" at $29.99 and 1x "Phoenix Skin" at $14.99
- **THEN** the cart total SHALL display $74.97

### Requirement: Cart drawer UI
The shopping cart SHALL be accessible as a slide-out drawer from any page via a cart icon in the header navigation.

#### Scenario: Opening cart drawer
- **WHEN** user clicks the cart icon in the navigation bar
- **THEN** a drawer SHALL slide in from the right side showing cart contents

#### Scenario: Cart item count badge
- **WHEN** user has items in the cart
- **THEN** the cart icon in the navigation SHALL display a badge showing the total number of items

### Requirement: Simulated checkout
The system SHALL provide a simulated checkout flow that collects display-only shipping information and shows an order confirmation.

#### Scenario: Completing checkout
- **WHEN** user clicks "Checkout" from the cart and fills in the form
- **THEN** the system SHALL display an order confirmation page with order summary
- **THEN** the cart SHALL be cleared

#### Scenario: Empty cart checkout prevention
- **WHEN** user attempts to access checkout with an empty cart
- **THEN** the system SHALL redirect to the product listing or show an empty cart message
