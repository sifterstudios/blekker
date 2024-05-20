// Copyright 2024 Sifterstudios

part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.signupSuccess(UserEntity uid) = _SignupSuccess;

  const factory AuthState.loginSuccess(SessionEntity session) = _LoginSuccess;

  const factory AuthState.failure(String message) = _Failure;
}
