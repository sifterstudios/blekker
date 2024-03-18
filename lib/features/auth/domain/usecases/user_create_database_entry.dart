import 'package:blekker/app/error/failures.dart';
import 'package:blekker/app/usecase/usecase.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserInitDatabase implements UseCase<String, UserDatabaseParams> {
  UserInitDatabase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String>> call(UserDatabaseParams params) async {
    return left(Failure(''));
  }
}

class UserDatabaseParams {
  UserDatabaseParams({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;
}
