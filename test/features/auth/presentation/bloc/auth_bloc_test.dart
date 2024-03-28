// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<UserSignup>(as: #MockUserSignup),
  ],
)
void main() {
  final mockUserSignup = MockUserSignup();
  final successDummy = Either<Failure, String>.right('success');
  final failureDummy =
      Either<Failure, String>.left(Failure('Please fill in all fields'));
  final userSignupParams = UserSignupParams(
    name: 'name',
    email: 'email',
    password: 'password',
  );

  group('AuthBloc', () {
    blocTest<AuthBloc, AuthState>(
      'emits success when given correct values',
      build: () {
        provideDummy(successDummy);
        when(
          mockUserSignup(
            userSignupParams,
          ),
        ).thenAnswer((_) async {
          return const Right('success');
        });
        return AuthBloc(userSignup: mockUserSignup);
      },
      act: (bloc) async {
        bloc
          ..add(const AuthEvent.started())
          ..add(const AuthEvent.signup('test', 'email', 'password'));
      },
      expect: () async => <AuthState>[
        const AuthState.initial(),
        const AuthState.loading(),
        const AuthState.success('success'),
      ],
    );
    blocTest<AuthBloc, AuthState>(
      'emits failure when given empty values',
      build: () {
        provideDummy(failureDummy);
        when(
          mockUserSignup(
            UserSignupParams(
              name: '',
              email: '',
              password: '',
            ),
          ),
        ).thenAnswer((_) async {
          return Left(Failure('Please fill in all fields'));
        });
        return AuthBloc(userSignup: mockUserSignup);
      },
      act: (bloc) async {
        bloc.add(const AuthEvent.signup('', '', ''));
      },
      expect: () async => <AuthState>[
        const AuthState.loading(),
        const AuthState.failure('Please fill in all fields'),
      ],
    );
  });
}
