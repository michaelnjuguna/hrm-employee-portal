import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  final navBarIconBrightness = brightness == Brightness.dark
      ? Brightness.light
      : Brightness.dark;

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: navBarIconBrightness,
        systemNavigationBarIconBrightness: navBarIconBrightness,
      ),
    );
  } else if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        statusBarIconBrightness: navBarIconBrightness,
      ),
    );
  }

  runApp(const ProviderScope(child: MyApp()));
}
