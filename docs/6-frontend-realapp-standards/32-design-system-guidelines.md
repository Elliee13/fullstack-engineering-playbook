# Design System Guidelines

## Goals
- Consistency
- Accessibility
- Reusability without overengineering

## Component tiers
- `components/ui`: primitives (Button, Input, Modal)
- `components/shared`: composed components (Navbar, SettingsPanel)
- `features/*/components`: feature-specific components

## Accessibility baseline
- Keyboard navigation works
- Visible focus states
- Labels for inputs
- ARIA only when needed (don’t misuse)

## Styling conventions
- Use a consistent spacing scale
- Avoid one-off inline styles unless truly local
- Prefer tokens/variables for colors and radii