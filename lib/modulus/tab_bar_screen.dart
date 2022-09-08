import 'package:eraa_soft/modulus/register_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:2 ,initialIndex: 0, child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(tabs:[
          Tab(icon: Icon(Icons.login),text: 'Login',),
          Tab(icon: Icon(Icons.app_registration),text: 'Registeration',),
        ] ),
      ),
      body: const TabBarView(children: [
        LoginScreen(),
        RegisterScreen(),
      ]),
    ));
  }
}
