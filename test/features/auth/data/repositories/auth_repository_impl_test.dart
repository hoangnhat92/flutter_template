import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_app/features/auth/data/models/user_model.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;

  setUpAll(() {
    registerFallbackValue(const UserModel(
      id: '1',
      email: 'test@example.com',
      name: 'Test User',
    ));
  });

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  const tUserModel = UserModel(
    id: '1',
    email: 'test@example.com',
    name: 'Test User',
  );

  const tEmail = 'test@example.com';
  const tPassword = 'password123';

  group('signIn', () {
    test('should return User when remote data source call is successful',
        () async {
      when(() => mockRemoteDataSource.signIn(
            email: tEmail,
            password: tPassword,
          )).thenAnswer((_) async => tUserModel);
      when(() => mockLocalDataSource.cacheUser(tUserModel))
          .thenAnswer((_) async => {});

      final result = await repository.signIn(
        email: tEmail,
        password: tPassword,
      );

      expect(result, const Right(tUserModel));
      verify(() => mockRemoteDataSource.signIn(
            email: tEmail,
            password: tPassword,
          )).called(1);
      verify(() => mockLocalDataSource.cacheUser(tUserModel)).called(1);
    });

    test('should return AuthFailure when remote data source call fails',
        () async {
      when(() => mockRemoteDataSource.signIn(
            email: tEmail,
            password: tPassword,
          )).thenThrow(Exception('Invalid credentials'));

      final result = await repository.signIn(
        email: tEmail,
        password: tPassword,
      );

      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.message, contains('Invalid credentials'));
        },
        (_) => fail('Should return failure'),
      );
      verify(() => mockRemoteDataSource.signIn(
            email: tEmail,
            password: tPassword,
          )).called(1);
      verifyNever(() => mockLocalDataSource.cacheUser(any()));
    });
  });

  group('signOut', () {
    test('should clear cache when sign out is successful', () async {
      when(() => mockRemoteDataSource.signOut()).thenAnswer((_) async => {});
      when(() => mockLocalDataSource.clearCache()).thenAnswer((_) async => {});

      final result = await repository.signOut();

      expect(result, const Right(null));
      verify(() => mockRemoteDataSource.signOut()).called(1);
      verify(() => mockLocalDataSource.clearCache()).called(1);
    });

    test('should return AuthFailure when sign out fails', () async {
      when(() => mockRemoteDataSource.signOut())
          .thenThrow(Exception('Sign out failed'));

      final result = await repository.signOut();

      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<AuthFailure>());
          expect(failure.message, contains('Sign out failed'));
        },
        (_) => fail('Should return failure'),
      );
      verify(() => mockRemoteDataSource.signOut()).called(1);
      verifyNever(() => mockLocalDataSource.clearCache());
    });
  });

  group('getCurrentUser', () {
    test('should return cached user when available', () async {
      when(() => mockLocalDataSource.getCachedUser())
          .thenAnswer((_) async => tUserModel);

      final result = await repository.getCurrentUser();

      expect(result, const Right(tUserModel));
      verify(() => mockLocalDataSource.getCachedUser()).called(1);
    });

    test('should return null when no user is cached', () async {
      when(() => mockLocalDataSource.getCachedUser())
          .thenAnswer((_) async => null);

      final result = await repository.getCurrentUser();

      expect(result, const Right(null));
      verify(() => mockLocalDataSource.getCachedUser()).called(1);
    });

    test('should return CacheFailure when getting cached user fails',
        () async {
      when(() => mockLocalDataSource.getCachedUser())
          .thenThrow(Exception('Cache error'));

      final result = await repository.getCurrentUser();

      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Cache error'));
        },
        (_) => fail('Should return failure'),
      );
      verify(() => mockLocalDataSource.getCachedUser()).called(1);
    });
  });

  group('isSignedIn', () {
    test('should return true when user is cached', () async {
      when(() => mockLocalDataSource.getCachedUser())
          .thenAnswer((_) async => tUserModel);

      final result = await repository.isSignedIn();

      expect(result, const Right(true));
      verify(() => mockLocalDataSource.getCachedUser()).called(1);
    });

    test('should return false when no user is cached', () async {
      when(() => mockLocalDataSource.getCachedUser())
          .thenAnswer((_) async => null);

      final result = await repository.isSignedIn();

      expect(result, const Right(false));
      verify(() => mockLocalDataSource.getCachedUser()).called(1);
    });
  });
}
