
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modulus/splash_screen/splashScreen.dart';


void main() {
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
        // appBarTheme: const AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarIconBrightness: Brightness.light,
        //   ),
        // )
      ),
      home: const SplashScreen(),
    );
  }
}

