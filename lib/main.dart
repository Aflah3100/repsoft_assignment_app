import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repsoft Assignment App',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFF6B17)),
        useMaterial3: true,
      ),
      home: SignInScreen(),
    );
  }
}
