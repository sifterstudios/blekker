// Copyright 2024 Sifterstudios

// Mocks generated by Mockito 5.4.4 from annotations
// in blekker/test/features/auth/domain/usecases/user_signup_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:appwrite/models.dart' as _i3;
import 'package:blekker/app/error/failures.dart' as _i7;
import 'package:blekker/app/utils/equatable/equatable_date_time.dart' as _i2;
import 'package:blekker/features/auth/domain/entities/session_entity.dart'
    as _i10;
import 'package:blekker/features/auth/domain/entities/user_entity.dart' as _i8;
import 'package:blekker/features/auth/domain/repository/auth_repository.dart'
    as _i4;
import 'package:fpdart/fpdart.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

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

class _FakeEquatableDateTime_0 extends _i1.SmartFake
    implements _i2.EquatableDateTime {
  _FakeEquatableDateTime_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i4.AuthRepository {
  @override
  _i5.Future<_i6.Either<_i7.Failure, _i8.UserEntity>>
      signupWithEmailAndPassword({
    required String? name,
    required String? email,
    required String? password,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #signupWithEmailAndPassword,
              [],
              {
                #name: name,
                #email: email,
                #password: password,
              },
            ),
            returnValue:
                _i5.Future<_i6.Either<_i7.Failure, _i8.UserEntity>>.value(
                    _i9.dummyValue<_i6.Either<_i7.Failure, _i8.UserEntity>>(
              this,
              Invocation.method(
                #signupWithEmailAndPassword,
                [],
                {
                  #name: name,
                  #email: email,
                  #password: password,
                },
              ),
            )),
            returnValueForMissingStub:
                _i5.Future<_i6.Either<_i7.Failure, _i8.UserEntity>>.value(
                    _i9.dummyValue<_i6.Either<_i7.Failure, _i8.UserEntity>>(
              this,
              Invocation.method(
                #signupWithEmailAndPassword,
                [],
                {
                  #name: name,
                  #email: email,
                  #password: password,
                },
              ),
            )),
          ) as _i5.Future<_i6.Either<_i7.Failure, _i8.UserEntity>>);

  @override
  _i5.Future<_i6.Either<_i7.Failure, _i10.SessionEntity>>
      loginWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #loginWithEmailAndPassword,
              [],
              {
                #email: email,
                #password: password,
              },
            ),
            returnValue:
                _i5.Future<_i6.Either<_i7.Failure, _i10.SessionEntity>>.value(
                    _i9.dummyValue<_i6.Either<_i7.Failure, _i10.SessionEntity>>(
              this,
              Invocation.method(
                #loginWithEmailAndPassword,
                [],
                {
                  #email: email,
                  #password: password,
                },
              ),
            )),
            returnValueForMissingStub:
                _i5.Future<_i6.Either<_i7.Failure, _i10.SessionEntity>>.value(
                    _i9.dummyValue<_i6.Either<_i7.Failure, _i10.SessionEntity>>(
              this,
              Invocation.method(
                #loginWithEmailAndPassword,
                [],
                {
                  #email: email,
                  #password: password,
                },
              ),
            )),
          ) as _i5.Future<_i6.Either<_i7.Failure, _i10.SessionEntity>>);
}

/// A class which mocks [UserEntity].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockUserEntity extends _i1.Mock implements _i8.UserEntity {
  @override
  String get uid => (super.noSuchMethod(
        Invocation.getter(#uid),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#uid),
        ),
        returnValueForMissingStub: _i9.dummyValue<String>(
          this,
          Invocation.getter(#uid),
        ),
      ) as String);

  @override
  _i2.EquatableDateTime get createdAt => (super.noSuchMethod(
        Invocation.getter(#createdAt),
        returnValue: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#createdAt),
        ),
        returnValueForMissingStub: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#createdAt),
        ),
      ) as _i2.EquatableDateTime);

  @override
  _i2.EquatableDateTime get updatedAt => (super.noSuchMethod(
        Invocation.getter(#updatedAt),
        returnValue: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#updatedAt),
        ),
        returnValueForMissingStub: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#updatedAt),
        ),
      ) as _i2.EquatableDateTime);

  @override
  String get username => (super.noSuchMethod(
        Invocation.getter(#username),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#username),
        ),
        returnValueForMissingStub: _i9.dummyValue<String>(
          this,
          Invocation.getter(#username),
        ),
      ) as String);

  @override
  _i2.EquatableDateTime get registration => (super.noSuchMethod(
        Invocation.getter(#registration),
        returnValue: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#registration),
        ),
        returnValueForMissingStub: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#registration),
        ),
      ) as _i2.EquatableDateTime);

  @override
  bool get activeStatus => (super.noSuchMethod(
        Invocation.getter(#activeStatus),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  List<dynamic> get labels => (super.noSuchMethod(
        Invocation.getter(#labels),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as List<dynamic>);

  @override
  _i2.EquatableDateTime get passwordUpdate => (super.noSuchMethod(
        Invocation.getter(#passwordUpdate),
        returnValue: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#passwordUpdate),
        ),
        returnValueForMissingStub: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#passwordUpdate),
        ),
      ) as _i2.EquatableDateTime);

  @override
  String get email => (super.noSuchMethod(
        Invocation.getter(#email),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#email),
        ),
        returnValueForMissingStub: _i9.dummyValue<String>(
          this,
          Invocation.getter(#email),
        ),
      ) as String);

  @override
  String get phone => (super.noSuchMethod(
        Invocation.getter(#phone),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#phone),
        ),
        returnValueForMissingStub: _i9.dummyValue<String>(
          this,
          Invocation.getter(#phone),
        ),
      ) as String);

  @override
  bool get emailVerification => (super.noSuchMethod(
        Invocation.getter(#emailVerification),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get phoneVerification => (super.noSuchMethod(
        Invocation.getter(#phoneVerification),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  Map<String, dynamic> get prefs => (super.noSuchMethod(
        Invocation.getter(#prefs),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);

  @override
  _i2.EquatableDateTime get accessedAt => (super.noSuchMethod(
        Invocation.getter(#accessedAt),
        returnValue: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#accessedAt),
        ),
        returnValueForMissingStub: _FakeEquatableDateTime_0(
          this,
          Invocation.getter(#accessedAt),
        ),
      ) as _i2.EquatableDateTime);

  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);

  @override
  _i3.User toUser() => (super.noSuchMethod(
        Invocation.method(
          #toUser,
          [],
        ),
        returnValue: _FakeUser_1(
          this,
          Invocation.method(
            #toUser,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeUser_1(
          this,
          Invocation.method(
            #toUser,
            [],
          ),
        ),
      ) as _i3.User);
}
