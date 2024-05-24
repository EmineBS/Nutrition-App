import 'package:flutter/material.dart';
import 'package:nutrition/homepage.dart';
import 'package:nutrition/signup.dart';
import 'package:nutrition/accueil.dart';
import 'package:nutrition/formulaire.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        '/signup': (context) => const SignUp(),
        '/homepage': (context) => const Homepage(),
        '/accueil': (context) => const Accueil(),
        '/formulaire': (context) => const Formulaire(),
      },
    );
  }
}
