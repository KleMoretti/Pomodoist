# Repository instructions

Write and maintain repository documentation in English.

## Fork development and releases

- `main` is reserved for synchronization with `upstream` (Kabanya/Pomodoist).
  Never commit or merge fork-specific work into `main`.
- `chinese` is this fork's development and release branch. Start future feature
  branches from it and merge completed fork work back into it.
- Publish this fork's Windows builds from `chinese` using the manual Windows
  workflow. Keep the original upstream attribution and license.
- This machine has no Dart/Flutter SDK. Do not install one for validation; use
  GitHub Actions with the pinned SDK and only the essential tests, then provide
  an installer for manual acceptance.

For Flutter UI, theme, component, or animation changes, read and follow
[docs/design-system.md](docs/design-system.md). It defines the shared styling,
accessibility, motion, dependency boundaries, and validation scope.

Keep shared design rules in that document and update it with intentional
design-system changes; do not create competing per-screen style guides.
