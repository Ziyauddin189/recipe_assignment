import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/generated/l10n.dart';
import 'package:nosh_assignment/views/home/internet_connectivity/dependency.dart';
import 'package:nosh_assignment/views/splash_screen.dart';

void main() {
  runApp(MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Recipe App',
      localizationsDelegates: const [LanguageTranslation.delegate],
      supportedLocales: LanguageTranslation.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}


