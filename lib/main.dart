import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safe_form/utilities/locator.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupLocator();
  runApp(const MyApp());
}
