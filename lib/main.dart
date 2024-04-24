import 'package:ecommerce/components/splash_screen.dart';
import 'package:ecommerce/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter();
  var languageBox = Hive.openBox("languageBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 242, 243),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 1, 160, 120),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 1, 120, 141)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: Home(),
    );
  }
}
