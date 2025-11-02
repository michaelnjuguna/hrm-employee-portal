import 'package:employee_portal/app/router.dart';
import 'package:employee_portal/app/theme.dart';
import 'package:employee_portal/core/providers/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'Portal',
      debugShowCheckedModeBanner: false,
      theme: FilamentTheme.light,
      darkTheme: FilamentTheme.dark,
      themeMode: themeMode,
      routerConfig: AppRouter.config(),
      // themeMode: ThemeMode.system,
    );
  }
}
