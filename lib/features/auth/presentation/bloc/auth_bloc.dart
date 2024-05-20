// Copyright 2024 Sifterstudios

import 'package:blekker/app/common/global_constants.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:blekker/features/auth/domain/entities/user_entity.dart';
import 'package:blekker/features/auth/domain/usecases/user_login.dart';
import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required UserSignup userSignup, required UserLogin userLogin})
      : _userSignup = userSignup,
        _userLogin = userLogin,
        super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        started: (_) => _onStarted(emit),
        signup: (event) => _onSignup(event, emit),
        login: (event) => _onLogin(event, emit),
      );
    });
  }

  final UserSignup _userSignup;
  final UserLogin _userLogin;

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
      (r) => emit(AuthState.signupSuccess(r)),
    );
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    final storedSession =
        Hive.box<SessionEntity>(GlobalConstants.hiveSessionEntityBox)
            .get(GlobalConstants.hiveSessionEntityKey);
    if (storedSession != null) {
      if (isSessionValid(storedSession)) {
        emit(AuthState.loginSuccess(storedSession));
        print(
            'Session is present and still valid, returning that instead of contacting appwrite');
        return;
      }
      print(
          'Session is present but expired, contacting appwrite to get a new session');
    }

    emit(const AuthState.loading());
    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (l) {
        emit(AuthState.failure(l.message));
        emit(const AuthState.initial());
      },
      (r) {
        emit(AuthState.loginSuccess(r));
        Hive.box<SessionEntity>(GlobalConstants.hiveSessionEntityBox)
            .put(GlobalConstants.hiveSessionEntityKey, r);
        emit(const AuthState.initial());
      },
    );
  }

  bool isSessionValid(SessionEntity storedSession) {
    return DateTime.now().isBefore(storedSession.expire.dateTime);
  }
}
