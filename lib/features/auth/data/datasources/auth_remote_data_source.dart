// Copyright 2024 Sifterstudios

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:blekker/app/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<User> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Session> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.client});

  final Client client;

  @override
  Future<Session> loginWithEmailAndPassword({
    required String email,
    required String password,
    Account? account,
  }) async {
    try {
      final localAccount = account ?? Account(client);
      final session = await localAccount.createEmailPasswordSession(
        email: email,
        password: password,
      );

      return session;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    String? userId,
    Account? account,
  }) async {
    try {
      final localAccount = account ?? Account(client);

      final user = await localAccount.create(
        userId: userId ?? ID.unique(),
        email: email,
        password: password,
        name: name,
      );

      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
