
import 'package:eraa_soft/posts_app/core/services/service_locator.dart';
import 'package:eraa_soft/posts_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chat_app/presentation/screen/chat_home_screen.dart';
import 'modulus/note_app/note_app_screen.dart';
import 'modulus/splash_screen/splashScreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const ChatHomeScreen(),
    );
  }
}

