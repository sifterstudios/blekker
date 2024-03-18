import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', useConstantCase: true)
abstract class Env {
  @EnviedField()
  static const String appwriteEndpoint = _Env.appwriteEndpoint;
  @EnviedField()
  static const String appwriteProjectId = _Env.appwriteProjectId;
}
