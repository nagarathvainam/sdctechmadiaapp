# sdctechmedia

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Bloc Pattern File Structure
----------------------------------------
lib/
├── blocs/
│   ├── auth/                 # BLoC for login/logout/authentication
│   │   ├── auth_bloc.dart
│   │   ├── auth_event.dart
│   │   └── auth_state.dart
│   └── user/                 # BLoC for CRUD operations on users
│       ├── user_bloc.dart
│       ├── user_event.dart
│       └── user_state.dart
│
├── models/
│   └── user_model.dart       # User model class
│
├── repositories/
│   ├── auth_repository.dart  # API calls for login/logout
│   └── user_repository.dart  # API calls for user CRUD
│
├── screens/
│   ├── login_screen.dart     # Login UI (connected to auth_bloc)
│   ├── register_screen.dart  # Create new user
│   └── user_list_screen.dart # View/update/delete users
│
└── main.dart                 # App entry with routing and session check
