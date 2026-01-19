# Architecture Documentation

## Overview

This Flutter application follows Clean Architecture principles with a feature-first folder structure, Bloc for state management, and dependency injection using GetIt.

## SOLID Principles Implementation

### 1. Single Responsibility Principle (SRP)

Each class has a single, well-defined responsibility:

- **Use Cases** (lib/features/auth/domain/usecases/): Each use case handles one specific business operation
  - `SignIn` - Handles sign-in logic
  - `SignOut` - Handles sign-out logic
  - `GetCurrentUser` - Retrieves current user

- **BLoC** (lib/features/auth/presentation/bloc/):
  - `AuthBloc` - Manages authentication state only
  - `AuthEvent` - Defines authentication events
  - `AuthState` - Defines authentication states

- **Data Sources** (lib/features/auth/data/data_sources/):
  - `AuthRemoteDataSource` - Handles remote API calls only
  - `AuthLocalDataSource` - Handles local cache operations only

### 2. Open/Closed Principle (OCP)

The system is open for extension but closed for modification:

- **Failure Hierarchy** (lib/core/error/failures.dart):
  - Base `Failure` class can be extended with new failure types without modifying existing code
  - Currently supports: `ServerFailure`, `CacheFailure`, `AuthFailure`, `NetworkFailure`

- **Repository Pattern**:
  - New data sources can be added without changing the repository interface
  - Implementation can be extended with new methods without breaking existing code

### 3. Liskov Substitution Principle (LSP)

Derived classes can be substituted for their base classes:

- **User Entity and Model** (lib/features/auth/domain/entities/, lib/features/auth/data/models/):
  - `UserModel` extends `User` entity
  - `UserModel` can be used anywhere `User` is expected
  - The model adds serialization logic without breaking the entity contract

- **Abstract Interfaces**:
  - `AuthRemoteDataSourceImpl` implements `AuthRemoteDataSource`
  - `AuthLocalDataSourceImpl` implements `AuthLocalDataSource`
  - Either implementation can be swapped without affecting the repository

### 4. Interface Segregation Principle (ISP)

Interfaces are client-specific rather than general-purpose:

- **Repository Interface** (lib/features/auth/domain/repositories/auth_repository.dart):
  - Defines only necessary authentication methods
  - Clients only depend on methods they actually use

- **Data Source Interfaces**:
  - `AuthRemoteDataSource` - Only remote operations (signIn, signOut)
  - `AuthLocalDataSource` - Only local operations (cacheUser, getCachedUser, clearCache)
  - Separated by their specific purposes

### 5. Dependency Inversion Principle (DIP)

High-level modules don't depend on low-level modules; both depend on abstractions:

- **Domain Layer**:
  - Use cases depend on `AuthRepository` interface (abstraction)
  - Never depends on concrete implementations

- **Data Layer**:
  - `AuthRepositoryImpl` implements `AuthRepository` interface
  - Depends on `AuthRemoteDataSource` and `AuthLocalDataSource` abstractions
  - Concrete implementations are injected via constructor

- **Dependency Injection** (lib/core/di/injection_container.dart):
  - GetIt container manages all dependencies
  - Interfaces are registered, implementations are provided
  - BLoC receives use cases through constructor injection

## Project Structure

```
lib/
├── core/
│   ├── di/                      # Dependency injection
│   ├── error/                   # Error handling
│   ├── navigation/              # Navigation logic
│   └── utils/                   # Utilities
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── data_sources/    # Local and remote data sources
│   │   │   ├── models/          # Data models
│   │   │   └── repositories/    # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/        # Business entities
│   │   │   ├── repositories/    # Repository interfaces
│   │   │   └── usecases/        # Business logic
│   │   └── presentation/
│   │       ├── bloc/            # State management
│   │       ├── pages/           # UI pages
│   │       └── widgets/         # UI widgets
│   ├── home/
│   ├── profile/
│   └── settings/
├── app.dart                     # App configuration
└── main.dart                    # Entry point
```

## Data Flow

1. **User Action** → UI Widget triggers event
2. **Event** → Dispatched to BLoC
3. **BLoC** → Calls appropriate Use Case
4. **Use Case** → Executes business logic via Repository interface
5. **Repository** → Coordinates between data sources
6. **Data Source** → Fetches/stores data
7. **Result** → Returns through layers to BLoC
8. **State** → BLoC emits new state
9. **UI Update** → Widget rebuilds with new state

## Testing Strategy

- **Unit Tests**: All business logic, repositories, and BLoCs are unit tested
- **Test Coverage**:
  - Domain layer (use cases)
  - Data layer (repositories, models)
  - Presentation layer (BLoCs)
- **Mocking**: Uses Mocktail for creating test doubles
- **BLoC Testing**: Uses bloc_test for testing state transitions

## Dependency Management

All dependencies are managed through GetIt service locator:

- **Factory Registration**: For BLoCs (new instance per request)
- **Lazy Singleton**: For use cases and data sources (created on first use)
- **Separation of Concerns**: Each feature can have its own dependency tree

## Navigation with Separate Dependency Trees

The tab bar navigation structure ensures each feature can have isolated dependencies:

- **Shared Dependencies**: Authentication BLoC is provided at app level
- **Feature Dependencies**: Each tab can have its own BLoC providers
- **IndexedStack**: Maintains state across tab switches

## Key Benefits

1. **Testability**: All layers can be tested in isolation
2. **Maintainability**: Changes in one layer don't affect others
3. **Scalability**: New features can be added without modifying existing code
4. **Flexibility**: Implementations can be swapped easily (e.g., mock to real API)
5. **Clear Separation**: Business logic is independent of UI and data sources
