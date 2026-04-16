import 'package:flutter/material.dart';
import 'package:noteapp_php/app/auth/login.dart';
import 'package:noteapp_php/app/auth/signup.dart';
import 'package:noteapp_php/app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "login",
      routes: {
          "login": (context) => Login(),
          "signup": (context) => Signup(),
          "home": (context) => Home(),

      },
      title: 'Course php',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}


