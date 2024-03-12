import 'package:blekker/app/app.dart';
import 'package:blekker/bootstrap.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() => const App());
}
