// Copyright 2024 Sifterstudios

// Mocks generated by Mockito 5.4.4 from annotations
// in blekker/test/features/auth/presentation/bloc/auth_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:blekker/app/error/failures.dart' as _i6;
import 'package:blekker/features/auth/domain/repository/auth_repository.dart'
    as _i2;
import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart' as _i3;
import 'package:fpdart/fpdart.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthRepository_0 extends _i1.SmartFake
    implements _i2.AuthRepository {
  _FakeAuthRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserSignup].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserSignup extends _i1.Mock implements _i3.UserSignup {
  @override
  _i2.AuthRepository get authRepository => (super.noSuchMethod(
        Invocation.getter(#authRepository),
        returnValue: _FakeAuthRepository_0(
          this,
          Invocation.getter(#authRepository),
        ),
        returnValueForMissingStub: _FakeAuthRepository_0(
          this,
          Invocation.getter(#authRepository),
        ),
      ) as _i2.AuthRepository);

  @override
  _i4.Future<_i5.Either<_i6.Failure, String>> call(
          _i3.UserSignupParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i4.Future<_i5.Either<_i6.Failure, String>>.value(
            _i7.dummyValue<_i5.Either<_i6.Failure, String>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i5.Either<_i6.Failure, String>>.value(
                _i7.dummyValue<_i5.Either<_i6.Failure, String>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i4.Future<_i5.Either<_i6.Failure, String>>);
}