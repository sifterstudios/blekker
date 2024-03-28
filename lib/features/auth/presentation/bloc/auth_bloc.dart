// Copyright 2024 Sifterstudios

import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required UserSignup userSignup})
      : _userSignup = userSignup,
        super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        started: (_) => _onStarted(emit),
        signup: (event) => _onSignup(event, emit),
      );
    });
  }

  final UserSignup _userSignup;

  Future<void> _onStarted(Emitter<AuthState> emit) async {
    emit(const AuthState.initial());
  }

  Future<void> _onSignup(_Signup event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final res = await _userSignup(
      UserSignupParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (l) => emit(AuthState.failure(l.message)),
      (r) => emit(AuthState.success(r)),
    );
  }
}
