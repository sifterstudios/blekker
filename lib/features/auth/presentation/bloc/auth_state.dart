// Copyright 2024 Sifterstudios

part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.success(UserEntity uid) = _Success;

  const factory AuthState.failure(String message) = _Failure;
}
