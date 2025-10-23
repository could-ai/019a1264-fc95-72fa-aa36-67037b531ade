# KTV MVP Website

A modern, production-ready KTV MVP with customer landing page and admin panel, built in Flutter for web.

## Tech Stack
- **Frontend**: Flutter (compiled to web HTML/CSS/JS)
- **Styling**: Custom Flutter widgets with Material Design, mimicking royal-class CSS variables (--white, --mint-1, etc.)
- **Mock APIs**: Static JSON files in `assets/data/` (loaded via rootBundle)
- **Animations**: Flutter's AnimationController and Transform for parallax/3D effects
- **Responsiveness**: Mobile-first with LayoutBuilder and breakpoints

## Getting Started
1. Ensure Flutter is installed and web support enabled: `flutter config --enable-web`
2. Clone or set up the project.
3. Run `flutter pub get` to install dependencies.
4. Launch the app: `flutter run -d web` (opens in browser).
5. For admin access, navigate to `/admin` (no auth yet; add later).

## Replacing Mock Endpoints with Real APIs
- Mocks are in `assets/data/*.json` and loaded in `lib/data/mock_data.dart`.
- To integrate real APIs (e.g., Node/Express backend):
  - Replace rootBundle calls with http.get() to your endpoints (e.g., `/api/rooms`).
  - Update models in `lib/models/` to match API responses.
  - Add error handling and loading states.
  - For Supabase: Connect the project (see chat prompts) and use supabase_flutter package for database ops.
- Example: In `room_card.dart`, change reserve button to call `http.post('/api/reserve', body: {...})`.

## Features
- Customer: Landing with parallax hero, room gallery, offers, reviews, quick reserve.
- Admin: Dashboard for rooms, queue, check-ins.
- Extensible: Modular code with comments for adding booking logic.

## Assets
- Replace placeholders in `assets/images/` with real ones.
- Design spec in `design_spec.md`.

For help, see [Flutter docs](https://flutter.dev/web).