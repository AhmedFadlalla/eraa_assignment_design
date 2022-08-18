import 'package:eraa_soft/modulus/file_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modulus/home_page.dart';
import '../modulus/job_screen.dart';



class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  List<Widget> homeScreens = [
    const HomePage(),
    const FileScreen(),
    const JobScreen()
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.file_open_rounded), label: 'File'),
    const BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),

  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: homeScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        onTap: (int index){

          setState(() {
            _currentIndex=index;
          });

        },
      ),
    );
  }
}
