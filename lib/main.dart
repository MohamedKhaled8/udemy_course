import 'package:flutter/material.dart';
import 'package:udemy_free_course/view/screen/home_page.dart';
import 'package:udemy_free_course/view/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
      home:  SpashScreen(),
    );
  }
}

