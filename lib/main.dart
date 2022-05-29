// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:postest7_farizfahrian_1915026033/page/details_page.dart';
import 'package:postest7_farizfahrian_1915026033/page/home_page.dart';
import 'package:postest7_farizfahrian_1915026033/page/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home-page': (context) => HomePage(),
        '/details-page': (context) => DetailsPage(),
      },
    );
  }
}
