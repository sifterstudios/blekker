// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HiveRepository {
  Future<Either<Failure, void>> saveData<T>({
    required String boxString,
    required String key,
    required Type T,
  });

  Future<Either<Failure, T>> getData<T>({
    required Type T,
    required String box,
    required String key,
  });

  Future<Either<Failure, void>> deleteData({
    required String box,
  });

  Future<Either<Failure, void>> init();
}
