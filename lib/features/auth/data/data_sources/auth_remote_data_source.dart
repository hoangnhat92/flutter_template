import '../../domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock authentication logic
    if (email.isNotEmpty && password.isNotEmpty) {
      return const User(
        id: '1',
        email: 'user@example.com',
        name: 'John Doe',
      );
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<void> signOut() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
