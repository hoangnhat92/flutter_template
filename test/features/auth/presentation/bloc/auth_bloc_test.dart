import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/auth/domain/entities/user.dart';
import 'package:flutter_app/features/auth/domain/usecases/get_current_user.dart';
import 'package:flutter_app/features/auth/domain/usecases/sign_in.dart';
import 'package:flutter_app/features/auth/domain/usecases/sign_out.dart';
import 'package:flutter_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSignIn extends Mock implements SignIn {}

class MockSignOut extends Mock implements SignOut {}

class MockGetCurrentUser extends Mock implements GetCurrentUser {}

void main() {
  late AuthBloc authBloc;
  late MockSignIn mockSignIn;
  late MockSignOut mockSignOut;
  late MockGetCurrentUser mockGetCurrentUser;

  setUp(() {
    mockSignIn = MockSignIn();
    mockSignOut = MockSignOut();
    mockGetCurrentUser = MockGetCurrentUser();
    authBloc = AuthBloc(
      signInUseCase: mockSignIn,
      signOutUseCase: mockSignOut,
      getCurrentUserUseCase: mockGetCurrentUser,
    );
  });

  tearDown(() {
    authBloc.close();
  });

  const tUser = User(
    id: '1',
    email: 'test@example.com',
    name: 'Test User',
  );

  const tEmail = 'test@example.com';
  const tPassword = 'password123';

  group('SignInRequested', () {
    test('initial state should be AuthInitial', () {
      expect(authBloc.state, equals(AuthInitial()));
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when sign in is successful',
      build: () {
        when(() => mockSignIn(email: tEmail, password: tPassword))
            .thenAnswer((_) async => const Right(tUser));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const SignInRequested(email: tEmail, password: tPassword),
      ),
      expect: () => [
        AuthLoading(),
        const Authenticated(tUser),
      ],
      verify: (_) {
        verify(() => mockSignIn(email: tEmail, password: tPassword)).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when sign in fails',
      build: () {
        when(() => mockSignIn(email: tEmail, password: tPassword))
            .thenAnswer((_) async => const Left(AuthFailure('Invalid credentials')));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const SignInRequested(email: tEmail, password: tPassword),
      ),
      expect: () => [
        AuthLoading(),
        const AuthError('Invalid credentials'),
      ],
      verify: (_) {
        verify(() => mockSignIn(email: tEmail, password: tPassword)).called(1);
      },
    );
  });

  group('SignOutRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] when sign out is successful',
      build: () {
        when(() => mockSignOut()).thenAnswer((_) async => const Right(null));
        return authBloc;
      },
      act: (bloc) => bloc.add(SignOutRequested()),
      expect: () => [
        AuthLoading(),
        Unauthenticated(),
      ],
      verify: (_) {
        verify(() => mockSignOut()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when sign out fails',
      build: () {
        when(() => mockSignOut())
            .thenAnswer((_) async => const Left(AuthFailure('Sign out failed')));
        return authBloc;
      },
      act: (bloc) => bloc.add(SignOutRequested()),
      expect: () => [
        AuthLoading(),
        const AuthError('Sign out failed'),
      ],
      verify: (_) {
        verify(() => mockSignOut()).called(1);
      },
    );
  });

  group('AuthStatusChecked', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when user is signed in',
      build: () {
        when(() => mockGetCurrentUser()).thenAnswer((_) async => const Right(tUser));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthStatusChecked()),
      expect: () => [
        AuthLoading(),
        const Authenticated(tUser),
      ],
      verify: (_) {
        verify(() => mockGetCurrentUser()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] when no user is signed in',
      build: () {
        when(() => mockGetCurrentUser()).thenAnswer((_) async => const Right(null));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthStatusChecked()),
      expect: () => [
        AuthLoading(),
        Unauthenticated(),
      ],
      verify: (_) {
        verify(() => mockGetCurrentUser()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] when getting current user fails',
      build: () {
        when(() => mockGetCurrentUser())
            .thenAnswer((_) async => const Left(CacheFailure('Cache error')));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthStatusChecked()),
      expect: () => [
        AuthLoading(),
        Unauthenticated(),
      ],
      verify: (_) {
        verify(() => mockGetCurrentUser()).called(1);
      },
    );
  });
}
