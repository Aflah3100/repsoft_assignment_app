import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repsoft_assignment_app/providers/auth_screen_provider.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/sign_in_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AuthScreenProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        title: 'Repsoft Assignment App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFF6B17)),
          useMaterial3: true,
        ),
        home: SignInScreen(),
      ),
    );
  }
}
