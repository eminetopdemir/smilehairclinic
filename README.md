# Smile Hair Clinic 

**Smile Hair Clinic** is a cross-platform Flutter application and responsive web prototype designed for a hair transplant clinic. It gives patients a single place to explore doctors, scan and track their recovery progress, follow their daily care routine, shop for aftercare products, and chat with a recovery assistant — all wrapped in a sleek, dark navy-and-turquoise UI.

Built with a single Flutter codebase, the app runs natively on **iOS and Android** while also compiling to a **responsive web app**, making it a strong fit for a Flutter Web / PWA deployment.

This repository contains the **front-end / UI prototype** of the app.

## Screenshots / Demo

> _Add screenshots or a screen recording here to showcase the UI._
>
> Suggested layout once images are available (e.g. placed under `docs/screenshots/`):
>
> | Welcome | Home | Capture | Profile |
> |---|---|---|---|
> | ![Welcome](docs/screenshots/welcome.png) | ![Home](docs/screenshots/home.png) | ![Capture](docs/screenshots/capture.png) | ![Profile](docs/screenshots/profile.png) |
>
> For the web build, you can also link a live demo once deployed:
> `🔗 Live demo: https://<your-deployment-url>`

## Overview

The app is built around five core sections, tied together in a single bottom-navigation shell:

| Screen | Description |
|---|---|
| 🏠 **Home** | A feed of clinic doctors with location, likes, tags, and before/after highlights — similar to a social feed for browsing specialists. |
| 📸 **Capture** | A guided, step-by-step photo capture flow (e.g. "Step 1/5 – Front View") that helps patients document their hair for progress tracking. |
| 🛍️ **Shop** | A grid-based store for aftercare products such as growth serums, shampoos, and scalp treatments. |
| 👤 **Profile** | Patient dashboard with upcoming appointments, a daily medication/regimen checklist (e.g. Finasteride, Minoxidil), and a visual progress timeline. |
| 💬 **Recovery Assistant** | A chatbot-style screen that sends recovery tips and milestones (wound care, first wash, healing stages) and lets patients ask questions. |

The app also includes a simple **authentication flow** (Welcome → Login / Register) and a placeholder **Doctor Panel** screen for clinic staff.

## Features

- Animated, glowing bottom navigation with a dedicated floating action button for quick photo capture
- Doctor discovery feed with profile cards, tags, and before/after indicators
- Guided face/hair scan capture flow with step tracking
- Daily care regimen tracker with toggle switches
- Visual recovery/progress timeline
- In-app recovery assistant chat with pre-set guidance messages
- Product shop with a responsive grid layout
- Custom dark theme (deep navy background with neon turquoise accents) using Google Fonts (Poppins)

## Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (Dart SDK `>=3.4.0 <4.0.0`)
- **Design:** Material Design with a fully custom dark theme
- **Fonts:** [google_fonts](https://pub.dev/packages/google_fonts) (Poppins)
- **Platforms:** Android, iOS, Web, Windows, macOS, Linux (all platform folders are included)

> **Note:** This build is currently a UI/UX prototype — the login/register screens and chatbot are not yet wired up to a real backend, authentication provider, or AI service. All content (doctors, products, chat messages, appointments) is static sample data intended to showcase the intended user experience for the clinic.

## Project Structure

```
lib/
├── auth/                 # Welcome, login, and register screens
│   ├── welcome_page.dart
│   ├── login_page.dart
│   └── register_page.dart
├── pages/                # Main app screens
│   ├── root_shell.dart   # Bottom navigation shell
│   ├── home_page.dart    # Doctor feed
│   ├── capture_page.dart # Guided photo capture
│   ├── shop_page.dart    # Product store
│   ├── profile_page.dart # Patient dashboard
│   ├── chatbot_page.dart # Recovery assistant
│   └── doctor_home.dart  # Doctor panel (placeholder)
├── widgets/               # Reusable UI components
│   ├── doctor_card.dart
│   ├── product_card.dart
│   ├── message_bubble.dart
│   └── progress_timeline.dart
├── theme/
│   └── app_theme.dart    # Colors, gradients, typography
└── main.dart              # App entry point

assets/
└── images/                # Avatar, hair, and product images
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (compatible with Dart `>=3.4.0`)
- A configured emulator/simulator, or a physical device, or a modern web browser

### Installation

```bash
# Clone the repository
git clone https://github.com/eminetopdemir/smilehairclinic.git
cd smilehairclinic

# Install dependencies
flutter pub get

# Run the app (pick a connected device/emulator, or use -d chrome for web)
flutter run
```

## Roadmap Ideas

Some natural next steps to turn this prototype into a production-ready clinic app:

- Connect authentication to a real backend (e.g. Firebase Auth or a custom API)
- Persist doctors, products, and appointments in a database
- Integrate a real chat/AI service for the Recovery Assistant
- Add real photo upload/analysis for the Capture flow
- Build out the Doctor Panel for clinic staff to manage patients and appointments

## License

This project currently has no license specified. Add a `LICENSE` file if you intend to open-source or share usage terms for this project.
