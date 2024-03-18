import 'package:envied/envied.dart';

part 'env.g.dart';

// ignore_for_file: constant_identifier_names
@Envied()
abstract class Env {
  @EnviedField()
  static const String APPWRITE_ENDPOINT = _Env.APPWRITE_ENDPOINT;
  @EnviedField()
  static const String APPWRITE_PROJECT_ID = _Env.APPWRITE_PROJECT_ID;
}
