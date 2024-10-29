 # Pikpo Video Call Application

Pikpo is a Flutter-based video call application that leverages GetIt for dependency injection and Cubit for state management. This project serves as a starting point for building robust video communication features.

## Features

- **Video Calling**: High-quality video calls between users.
- **Dependency Injection**: Utilizes `GetIt` for efficient service management.
- **State Management**: Implements `Cubit` for managing application state.
- **Responsive Design**: Optimized for various screen sizes.

## Getting Started

To get started with Pikpo, follow the instructions below:

### Prerequisites

- Flutter SDK version 3.24.3 or higher
- Dart SDK (comes with Flutter)

### Branches

- **development**: This branch contains the UI implementation and is intended for ongoing UI development.
- **feat/video_call**: This branch includes the implementation of the video call feature. If you want to see the results of the video call implementation, you can check this branch.

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/pikpo.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd app_pikpo
   ```

3. **Install the dependencies**:

   ```bash
   flutter pub get
   ```

### Setup Dependency Injection

Run the following command to generate the necessary code for dependency injection:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run the Application

After generating the code, you can run the application:

```bash
flutter run
```

### Project Structure

```
app_pikpo/
├── lib/
│   ├── core/
│   │   └── di/
│   │       ├── service_locator.dart
│   │       └── service_locator.config.dart
│   ├── features/
│   │   ├── auth/
│   │   ├── chat/
│   │   ├── dashboard/
│   │   └── screen_sharing/
│   │   └── transcript/
│   └── main.dart
├── pubspec.yaml
└── README.md
```

### Technologies Used

- **Flutter**: Framework for building cross-platform mobile applications.
- **GetIt**: Service locator for dependency injection.
- **Cubit**: Lightweight state management solution.
