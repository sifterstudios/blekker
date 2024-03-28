// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_signup_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<AuthRepository>(as: #MockAuthRepository),
  ],
)
void main() {
  final authRepository = MockAuthRepository();
  final userSignup = UserSignup(authRepository: authRepository);
  final successDummy = Either<Failure, String>.right('success');
  final failureDummy =
      Either<Failure, String>.left(Failure('Please fill in all fields'));
  group('UserSignUp', () {
    test('should return RIGHT when correct arguments are passed', () async {
      // arrange
      provideDummy(successDummy);
      when(
        authRepository.signupWithEmailAndPassword(
          name: 'name',
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => const Right('success'));
      // act
      final result = await userSignup(
        UserSignupParams(
          name: 'name',
          email: 'email',
          password: 'password',
        ),
      );
      // assert
      expect(result.isRight(), true);
    });
    test('should return LEFT if arguments are empty', () async {
      // arrange
      provideDummy(failureDummy);
      when(
        authRepository.signupWithEmailAndPassword(
          name: '',
          email: '',
          password: '',
        ),
      ).thenAnswer((_) async => Left(Failure('Please fill in all fields')));
      // act
      final result = await userSignup(
        UserSignupParams(
          name: '',
          email: '',
          password: '',
        ),
      );
      // assert
      expect(result.isLeft(), true);
    });
  });
}
