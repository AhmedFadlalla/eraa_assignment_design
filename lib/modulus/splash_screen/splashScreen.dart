
import 'package:eraa_soft/modulus/splash_screen/widgets/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../splash_screen/widgets/body.dart';





class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000299),
      body: SplashBodyView(),
    );
  }
}
