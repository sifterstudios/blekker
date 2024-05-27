// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/domain/repository/hive_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepositoryImpl implements HiveRepository {
  HiveRepositoryImpl(this.hive);

  final HiveInterface hive;

  @override
  Future<Either<Failure, void>> deleteData({required String box}) async {
    try {
      await hive.deleteBoxFromDisk(box);
      return right(null);
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, T>> getData<T>({
    required Type T,
    required String box,
    required String key,
  }) async {
    try {
      final boxInstance = await hive.openBox<T>(box);
      final value = boxInstance.get(key);
      if (value != null) {
        return right(value as T);
      } else {
        return left(Failure('Data not found in box $box'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> init() async {
    try {
      await hive.initFlutter();
      return right(null);
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveData<T>({
    required String boxString,
    required String key,
    required Type T,
  }) async {
    final box = await hive.openBox<T>(boxString);
    try {
      await box.put(key, T as T);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
