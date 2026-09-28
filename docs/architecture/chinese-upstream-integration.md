# Chinese upstream integration record

This document records the selective integration of the upstream `main` snapshot
into the Chinese personal edition. It is the repository-side source-to-port
ledger for the implementation branch and should be updated before a later merge
or release. The branch is intentionally not a blanket merge of upstream.

## Product boundary

The integrated build keeps the Chinese default language, the existing Chinese
copy, bundled Noto Sans SC, local task/focus/calendar behavior, bounded task
recurrence, the day-based Today focus picker, and the existing local database and
preferences locations. It remains a subscription-free personal edition.

The personal edition does not construct StoreKit or Stripe billing services,
render purchase/restore/offer entry points, or use the upstream GitHub release
feed. Cloud account and synchronization code remains available only where the
current client architecture requires dormant compatibility types; collaboration
features and server rollout are not enabled by this integration.

## Adopted source changes

| Source SHA | Port result |
|---|---|
| `87bd487`, `71a9814` | Project/label handling and localization infrastructure were moved into `apps/flutter`; existing Chinese wording remains authoritative. |
| `4a99360`, `b77b954`, `faa9287`, `c5a1fd5` | The final Flutter architecture, explicit entry-point environment handling, MVVM boundaries, repositories and services were adopted as one foundation. Fork behavior was carried into the new paths instead of replaying old-file patches. |
| `7ca63a1`, `e364cb4` | Quick Add owns session state per root overlay and build/tool paths follow the relocated Flutter project. |
| `beb453a`, `97498e4` | Native/localization resources and authentication-provider handling were ported without replacing Chinese translations or enabling a hosted backend. |
| `0e96637`, `ad264f5` | Relevant test scaffolding and voice-capture lifecycle fixes were retained; payment suites and optional macOS release machinery were not made part of the local delivery. |
| `913371e`, `1c9539a`, `66f92d2`, `920fa66`, `cf036cc` | Flavor/configuration and Windows link/build repairs were adapted for the Chinese workflow. The existing fork version/build identity and manual `chinese` workflow remain in force. |
| `68beaf1` | Only the approved client endpoint declarations and origin validation were retained. The API v1 schema, migrations, functions and deployment baseline were not imported. |
| `5714406` | Onboarding swipe/illustration improvements were retained, while the personal edition hides the Pro/paywall step. |
| `176587a`, `0c2bc75`, `a30a225` | Local calendar planning, task editing/selection/focus actions and applicable readability fixes were retained. Cloud calendar error/release payloads were excluded. |
| `3488cfc` | Applicable widget expectation fixes were ported without adopting the upstream build number. |
| `b42ba15` | Mobile calendar layout, configurable bottom navigation, shared action menus and focus controls were retained; commercial and collaboration copy was excluded. |
| `67947d6` | Focus layout, keyboard/accessibility behavior, menu placement and navigation fixes were retained while preserving Chinese preset labels and the shared focus setup flow. |
| `ed1c160` | Daily-combo recalculation/announcement fixes, compact focus layout fixes and the Windows update-helper process fix were retained. Cloud-calendar localization and release changes were excluded. |

The final architecture already contains the applicable client-side sync safety
from `eebb9b0`: bounded 100-operation pushes, `413`/`PT413` recursive splitting,
stable operation order/IDs, pending-command retention and focused regression
tests. It is represented in the new `data/services/sync` files and was not
replayed from the obsolete `core/sync` paths.

The following fixes are likewise already represented in the foundation and were
not applied a second time from their old paths:

- `f9ffc7f`, `7b85098`, and `d2b7d80`: stable multi-project Kanban status
  columns, identity-based ordering/focus and mirrored status-ID resolution.
- `7a41a11`: the Material ancestor for Move project dialog rows.
- `0afe5f9`: the live-session fallback used when an auth snapshot is stale.

## Explicit exclusions and deferrals

The following source areas remain outside this local Windows-first delivery:

- Collaboration and shared-project commits (`7e8d994`, `bfd9df8`, `4bd3cf4`,
  `f70ff9e`, `abfc1e8`, `fdc8e7e`, `56e83e7`, `04b2649`, `cd172e3`,
  `e844fca`, `853bc73`, `785c581`, `d779e22`) and shared Kanban revisions
  (`adf842c`). They require a coordinated server/API/ACL migration.
- Server/API v1 migrations, branch deployment, release-tag publication,
  invitation mail and companion-client changes (`a2c63e4`, `435227c`,
  `9a029e3`, `856957d`, `4395368`, `f42890f`, `9b8b924`, `fb3515b`,
  `28139a9`, `20bafe8`).
- StoreKit/Stripe offers, trials, checkout, purchase linking, restore flows and
  related migrations (`cac9a67`, `a647965`, `d8ae076`, the subscription parts
  of `eebb9b0`, and `3ee953c`). The dormant hosted billing implementation is
  retained only as a source-compatible boundary; the personal composition does
  not read its store provider.
- Android/Linux/macOS/TestFlight release expansion and broad CI/CD changes
  (`d3d52a2`, `a64330c`, `c1a3a13`, `70021b2`, `23a6397`, `333d895`). Only
  required Windows path/link behavior was adapted.

These are deliberate scope decisions, not claims that the upstream features are
incorrect. Reconsider them only as complete product programs with their backend,
security, migration and release contracts.

## Personal-edition safeguards

- `personalEdition` is an explicit composition flag, and
  `PersonalEditionBillingRepository` grants local access without fabricating a
  hosted entitlement.
- Billing provider construction returns the personal repository before reading
  the StoreKit/Stripe dependencies. Task-decomposition transport receives no
  billing store in this edition and sends no store transaction proofs.
- Settings, onboarding, the post-onboarding offer window and the voice access
  fallback have no personal-edition purchase surface. A defensive paywall guard
  also returns an empty surface if a dormant hosted widget is reached.
- The updater rejects the upstream repository for this edition. Automatic and
  manual official checks are disabled until a fork-owned manifest/channel and
  compatibility-tested assets exist. The retained Windows helper can still be
  validated independently.

## Validation status

The repository checks that do not require Flutter should be run from the
repository root with UTF-8 enabled on Windows:

```text
python -X utf8 tool/check_architecture.py
python -X utf8 tool/check_localization.py
python -X utf8 -m unittest discover -s tool -p "test_*.py"
git diff --check
```

The current desktop-first checkout passes `check_architecture.py`, the
supported-locale ARB parity/placeholder check, and the Python contract suite
when the macOS-specific `test_macos_reset.py` is excluded (that test requires
the unavailable macOS/PowerShell toolchain). The full localization checker is
not currently runnable here: it expects the optional iOS/macOS source trees and
its legacy `app_pt_BR` marker-only catalog contract, while this checkout keeps
the existing local-calendar Brazilian catalog. Re-run that full check when the
deferred platform catalog set is restored or the checker contract is updated.

The repository pins Flutter `3.47.0` in `.fvmrc`, but this worktree currently
has no `.fvm/flutter_sdk/bin/flutter`, `fvm`, `flutter` or `dart` executable.
Therefore `gen-l10n`, Dart formatting, Flutter analysis and Flutter unit tests
remain unverified until that SDK is provisioned. The ARB catalogs and the
temporary `AppL10nUpstreamAdditions` extension are intentionally kept ready for
the pinned `gen-l10n` run; generated output must be regenerated by that SDK, not
hand-edited as a substitute.

Visual/manual acceptance is still required for Chinese text in the main and
Quick Add windows, light/dark themes, recurrence end dates, Today focus filtering,
round targets, session switching, calendar actions, navigation/menus and the
absence of commercial prompts. A real Windows upgrade acceptance pass is a
separate release task and is not claimed by this integration record.
