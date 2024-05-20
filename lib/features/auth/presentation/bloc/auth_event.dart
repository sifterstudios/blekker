// Copyright 2024 Sifterstudios 

part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.signup(
    String name,
    String email,
    String password,
  ) = _Signup;

  const factory AuthEvent.login(
    String email,
    String password,
  ) = _Login;
}
