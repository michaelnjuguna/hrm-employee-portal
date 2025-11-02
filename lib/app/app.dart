import 'package:employee_portal/app/router.dart';
import 'package:employee_portal/app/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portal',
      debugShowCheckedModeBanner: false,
      theme: FilamentTheme.light,
      darkTheme: FilamentTheme.dark,
      routerConfig: AppRouter.config(),
      themeMode: ThemeMode.system,
    );
  }
}
