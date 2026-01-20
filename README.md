# Flutter Skeleton Project

A production-ready Flutter skeleton project following Clean Architecture, SOLID principles, and feature-first structure.

## Features

- **Authentication Flow**: Complete sign-in/sign-out functionality
- **Tab Bar Navigation**: Main tab bar with Home, Profile, and Settings
- **State Management**: BLoC pattern for predictable state management
- **Dependency Injection**: GetIt for managing dependencies
- **Clean Architecture**: Separation of concerns with domain, data, and presentation layers
- **Feature-First Structure**: Organized by features for better scalability
- **Unit Tests**: Comprehensive test coverage for all layers
- **SOLID Principles**: Following best practices for maintainable code

## Requirements

- Flutter 3.38.0 or higher
- Dart 3.10.7 or higher

## Getting Started

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

### Running Tests

```bash
flutter test
```

## Project Structure

```
lib/
├── core/                        # Core functionality
│   ├── di/                      # Dependency injection setup
│   ├── error/                   # Error handling
│   ├── navigation/              # Navigation configuration
│   └── utils/                   # Utility functions
├── features/                    # Feature modules
│   ├── auth/                    # Authentication feature
│   │   ├── data/                # Data layer
│   │   ├── domain/              # Business logic layer
│   │   └── presentation/        # UI layer
│   ├── home/                    # Home feature
│   ├── profile/                 # Profile feature
│   └── settings/                # Settings feature
├── app.dart                     # App configuration
└── main.dart                    # Entry point
```

## Architecture

This project follows **Clean Architecture** principles with three main layers:

1. **Domain Layer**: Contains business entities, repository interfaces, and use cases
2. **Data Layer**: Implements repositories, handles data sources (remote & local)
3. **Presentation Layer**: Contains UI components, BLoC state management

For detailed architecture documentation, see [ARCHITECTURE.md](ARCHITECTURE.md).

## Key Technologies

- **flutter_bloc**: State management with sealed classes
- **freezed**: Immutable models and sealed classes with code generation
- **get_it**: Dependency injection
- **dartz**: Functional programming (Either type for error handling)
- **json_annotation**: JSON serialization annotations
- **mocktail**: Mocking for tests
- **bloc_test**: Testing BLoCs
- **build_runner**: Code generation tool

## Authentication

The app includes a mock authentication system. To sign in:

- Email: Any non-empty string
- Password: Any non-empty string

The authentication state persists in memory during the session.

## Navigation

After signing in, users are navigated to a tab bar with three sections:

- **Home**: Main home screen
- **Profile**: User profile with sign-out functionality
- **Settings**: App settings

## Dependency Injection

Dependencies are managed through GetIt service locator (`lib/core/di/injection_container.dart`):

- BLoCs are registered as factories (new instance per request)
- Use cases and repositories are registered as lazy singletons
- Data sources are registered as lazy singletons

## Testing

The project includes comprehensive unit tests:

- **BLoC Tests**: Testing state transitions and event handling
- **Repository Tests**: Testing data layer logic
- **Model Tests**: Testing serialization/deserialization
- **Use Case Tests**: Can be added following the same pattern

Run tests with:
```bash
flutter test
```

## Code Generation

The project uses **freezed** and **json_serializable** for code generation:

### Generate Code
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Watch for Changes (Development)
```bash
dart run build_runner watch --delete-conflicting-outputs
```

### What Gets Generated

- **Freezed Models**: Immutable data classes with copyWith, equality, and toString
- **Sealed Classes**: Type-safe unions for events and states
- **JSON Serialization**: Automatic fromJson/toJson methods
- **Pattern Matching**: Exhaustive .when() and .maybeWhen() methods

Generated files (*.freezed.dart, *.g.dart) are already included in the repository for convenience.

## SOLID Principles

The codebase strictly follows SOLID principles:

- **S**ingle Responsibility: Each class has one reason to change
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Subtypes can replace their base types
- **I**nterface Segregation: Clients depend only on what they use
- **D**ependency Inversion: Depend on abstractions, not concretions

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed examples.

## Adding New Features

To add a new feature:

1. Create feature folder: `lib/features/your_feature/`
2. Add domain layer:
   - Entities in `domain/entities/`
   - Repository interface in `domain/repositories/`
   - Use cases in `domain/usecases/`
3. Add data layer:
   - Models in `data/models/`
   - Data sources in `data/data_sources/`
   - Repository implementation in `data/repositories/`
4. Add presentation layer:
   - BLoC in `presentation/bloc/`
   - Pages in `presentation/pages/`
   - Widgets in `presentation/widgets/`
5. Register dependencies in `lib/core/di/injection_container.dart`
6. Add tests in `test/features/your_feature/`

## Contributing

When contributing, please:

1. Follow the existing architecture patterns
2. Maintain SOLID principles
3. Write unit tests for new code
4. Update documentation as needed

## License

This project is a template and can be freely used for any purpose.
