import 'package:blekker/app/error/failures.dart';
import 'package:blekker/app/usecase/usecase.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  UserSignup({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
    return authRepository.signupWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignupParams {
  UserSignupParams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
}
