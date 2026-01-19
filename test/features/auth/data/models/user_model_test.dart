import 'package:flutter_app/features/auth/data/models/user_model.dart';
import 'package:flutter_app/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tUserModel = UserModel(
    id: '1',
    email: 'test@example.com',
    name: 'Test User',
  );

  test('should be a subclass of User entity', () {
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () {
      final Map<String, dynamic> jsonMap = {
        'id': '1',
        'email': 'test@example.com',
        'name': 'Test User',
      };

      final result = UserModel.fromJson(jsonMap);

      expect(result, equals(tUserModel));
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () {
      final result = tUserModel.toJson();

      final expectedMap = {
        'id': '1',
        'email': 'test@example.com',
        'name': 'Test User',
      };

      expect(result, equals(expectedMap));
    });
  });

  group('fromEntity', () {
    test('should create a UserModel from User entity', () {
      const tUser = User(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
      );

      final result = UserModel.fromEntity(tUser);

      expect(result, equals(tUserModel));
      expect(result, isA<UserModel>());
    });
  });
}
