import 'package:flutter/material.dart';
import 'package:safe_form/utilities/locator.dart';
import 'package:safe_form/utilities/route_names.dart';
import 'package:safe_form/utilities/router.dart';

import 'services/navigation_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe App Form',
      navigatorKey: locator<NavigationService>().navigationKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: SectionListRoute,
    );
  }
}
