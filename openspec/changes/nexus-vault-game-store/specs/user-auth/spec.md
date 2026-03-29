## ADDED Requirements

### Requirement: User registration
The system SHALL allow users to register using email and password via Supabase Auth.

#### Scenario: Successful registration
- **WHEN** user fills in email and password on the registration page and submits
- **THEN** a new user account SHALL be created in Supabase Auth
- **THEN** a corresponding profile record SHALL be created in the profiles table
- **THEN** the user SHALL be redirected to the homepage

#### Scenario: Registration with existing email
- **WHEN** user attempts to register with an email already in use
- **THEN** an error message SHALL be displayed indicating the email is taken

### Requirement: User login
The system SHALL allow registered users to log in using email and password.

#### Scenario: Successful login
- **WHEN** user enters valid credentials and submits the login form
- **THEN** the user SHALL be authenticated and redirected to the homepage
- **THEN** the navigation SHALL update to show the user's profile info and a logout option

#### Scenario: Invalid credentials
- **WHEN** user enters incorrect email or password
- **THEN** an error message SHALL be displayed without revealing which field is incorrect

### Requirement: User session management
The system SHALL maintain user sessions using Supabase Auth's built-in session management with automatic token refresh.

#### Scenario: Session persists across page refreshes
- **WHEN** a logged-in user refreshes the page
- **THEN** the user SHALL remain authenticated

#### Scenario: Session expiry
- **WHEN** the user's session expires and cannot be refreshed
- **THEN** the user SHALL be logged out gracefully and redirected to the homepage

### Requirement: Protected routes
Certain pages (checkout, order history) SHALL require authentication. Unauthenticated users SHALL be redirected to the login page.

#### Scenario: Accessing checkout while logged out
- **WHEN** an unauthenticated user attempts to access the checkout page
- **THEN** the user SHALL be redirected to the login page
- **THEN** after successful login, the user SHALL be redirected back to checkout

### Requirement: User logout
The system SHALL allow users to log out, clearing their session.

#### Scenario: Logging out
- **WHEN** user clicks the "Logout" button
- **THEN** the session SHALL be destroyed
- **THEN** the navigation SHALL revert to showing login/register options
- **THEN** the user SHALL remain on the current page (unless it is a protected route)

### Requirement: Auth-aware navigation
The navigation bar SHALL display different UI elements based on authentication state: login/register buttons for guests, user avatar/name and logout for authenticated users.

#### Scenario: Guest navigation
- **WHEN** no user is logged in
- **THEN** the navigation SHALL show "Login" and "Register" links

#### Scenario: Authenticated navigation
- **WHEN** a user is logged in
- **THEN** the navigation SHALL show the user's username/avatar and a "Logout" button
