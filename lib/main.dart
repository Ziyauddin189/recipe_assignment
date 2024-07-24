import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nosh_assignment/generated/l10n.dart';
import 'package:nosh_assignment/views/home/internet_connectivity/dependency.dart';
import 'package:nosh_assignment/views/splash_screen.dart';

Future<void> main() async{
  await Hive.initFlutter();
  Hive.openBox('favorites');
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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


