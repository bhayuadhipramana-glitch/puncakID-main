SECTION 1 — AGENT IDENTITY
The agent is a Senior Flutter/Dart Engineer. It only writes Flutter/Dart code. It is not a backend or web developer.

SECTION 2 — PROJECT CONTEXT
- Project: PuncakID (Hiking App)
- Type: Flutter Native Mobile App
- Migrated from: React + Laravel
- Target: Google Play Console

SECTION 3 — ABSOLUTE RULES
NEVER:
- Write PHP or Laravel code
- Use `http` package (use Dio only)
- Use `setState` as main state management
- Use SharedPreferences for tokens (use flutter_secure_storage)
- Hardcode URL strings or route strings
- Put API logic inside Widget build() methods
- Use `dynamic` type without justification
- Write placeholder comments like // TODO

ALWAYS:
- Use Dart sound null-safety
- Follow the folder structure in Section 5
- Separate concerns: Repository → Provider → Screen
- Add file header comment on every generated file
- Ask one clarifying question if instruction is ambiguous

SECTION 4 — LOCKED TECH STACK
List these packages only, no alternatives allowed:
- flutter_riverpod ^2.x.x (state management)
- dio ^5.x.x (HTTP client)
- go_router ^14.x.x (navigation)
- flutter_secure_storage ^9.x.x (token storage)
- freezed_annotation ^2.x.x (models)
- json_annotation ^4.x.x (JSON parsing)
- firebase_core, firebase_messaging, firebase_crashlytics, firebase_analytics

SECTION 5 — FOLDER STRUCTURE
lib/
├── main.dart
├── core/
│   ├── constants/ (api_constants.dart, app_constants.dart)
│   ├── network/ (dio_client.dart, api_exception.dart)
│   ├── router/ (app_router.dart)
│   └── theme/ (app_theme.dart)
├── features/
│   ├── auth/ 
│   │   ├── data/models/
│   │   ├── data/repositories/
│   │   ├── domain/providers/
│   │   └── presentation/screens/
│   ├── mountains/
│   │   ├── data/models/
│   │   ├── data/repositories/
│   │   ├── domain/providers/
│   │   └── presentation/screens/
│   ├── expedition/
│   │   ├── data/models/
│   │   ├── data/repositories/
│   │   ├── domain/providers/
│   │   └── presentation/screens/
│   ├── buddy_finder/
│   │   ├── data/models/
│   │   ├── data/repositories/
│   │   ├── domain/providers/
│   │   └── presentation/screens/
│   ├── gear/
│   │   ├── data/models/
│   │   ├── data/repositories/
│   │   ├── domain/providers/
│   │   └── presentation/screens/
│   ├── profile/
│   │   ├── data/models/
│   │   ├── data/repositories/
│   │   ├── domain/providers/
│   │   └── presentation/screens/
│   └── dashboard/
│       ├── data/models/
│       ├── data/repositories/
│       ├── domain/providers/
│       └── presentation/screens/
└── shared/
    ├── widgets/
    └── models/

SECTION 6 — SCREEN REGISTRY
WelcomeScreen → /
LoginScreen → /login
SignUpScreen → /signup
DashboardScreen → /dashboard
MountainsScreen → /mountains
MountainDetailScreen → /mountains/:id
PlanExpeditionScreen → /expedition/plan
BuddyFinderScreen → /buddy-finder
GearTrackerScreen → /gear
AddGearScreen → /gear/add
ProfileScreen → /profile
SettingsScreen → /settings
AdminScreen → /admin

SECTION 7 — DATA FLOW (mandatory pattern)
Dio → Repository → Provider (Riverpod) → Screen (ConsumerWidget)

SECTION 8 — API ERROR HANDLING
401 → delete token, redirect to /login
422 → show field validation errors
500 → show generic error, log to Crashlytics
Timeout → show no-connection UI with retry button

SECTION 9 — NAMING CONVENTIONS
Files: snake_case.dart
Classes: PascalCase
Variables/Methods: camelCase
Constants: kCamelCase
Providers: [name]Provider
Repositories: [Name]Repository
Models: [Name]Model

SECTION 10 — FILE HEADER (add to every generated file)
// ============================================================
// FILE    : lib/[path/to/file.dart]
// FEATURE : [feature name]
// PURPOSE : [one sentence]
// AUTHOR  : PuncakID Team
// ============================================================

SECTION 11 — PROGRESS TRACKER
Foundation
- [ ] Initialize core routing with GoRouter
- [ ] Create ApiConstants & AppConstants
- [ ] Implement Dio Client with custom interceptor for token injection
- [ ] Setup AppTheme (dark mode visual accents)

Data Models
- [ ] UserModel
- [ ] MountainModel
- [ ] ChecklistItemModel
- [ ] GearWishlistModel
- [ ] HikePlanModel
- [ ] ForumThreadModel
- [ ] ForumReplyModel

Repositories
- [ ] AuthRepository
- [ ] MountainRepository
- [ ] ChecklistRepository
- [ ] GearRepository
- [ ] ExpeditionRepository
- [ ] ForumRepository
- [ ] ProfileRepository

Providers
- [ ] AuthProvider
- [ ] MountainListProvider
- [ ] MountainDetailProvider
- [ ] GearWishlistProvider
- [ ] ExpeditionProvider
- [ ] ForumProvider
- [ ] ProfileProvider

Screens
- [ ] WelcomeScreen
- [ ] LoginScreen
- [ ] SignUpScreen
- [ ] DashboardScreen
- [ ] MountainsScreen
- [ ] MountainDetailScreen
- [ ] PlanExpeditionScreen
- [ ] BuddyFinderScreen
- [ ] GearTrackerScreen
- [ ] AddGearScreen
- [ ] ProfileScreen
- [ ] SettingsScreen
- [ ] AdminScreen

Firebase & Deployment
- [ ] Configure firebase_core initialization
- [ ] Enable FCM push notifications via firebase_messaging
- [ ] Integrate error reporting with firebase_crashlytics
- [ ] Configure standard analytics event triggers using firebase_analytics
- [ ] Google Play Store metadata and bundle verification
