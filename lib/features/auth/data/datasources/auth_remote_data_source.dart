import 'package:appwrite/appwrite.dart';
import 'package:blekker/app/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.client});

  final Client client;

  @override
  Future<String> loginWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final account = Account(client);

      final userResponse = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );

      return userResponse.$id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
