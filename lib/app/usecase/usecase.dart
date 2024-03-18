import 'package:blekker/app/error/failures.dart';
import 'package:fpdart/fpdart.dart';

// ignore: one_member_abstracts
abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
