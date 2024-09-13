import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/screens/select_courier_screen/select_courier_screen.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/sign_in_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (context) {
      return const MyApp();
    }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Repsoft Assignment App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFF6B17)),
        useMaterial3: true,
      ),
      home: SelectCourierScreen(),
    );
  }
}
