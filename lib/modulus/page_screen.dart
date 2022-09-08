import 'package:eraa_soft/modulus/file_screen.dart';
import 'package:eraa_soft/modulus/home_page.dart';
import 'package:eraa_soft/modulus/job_screen.dart';
import 'package:eraa_soft/modulus/tab_bar_screen.dart';
import 'package:eraa_soft/modulus/todo_app/todo_homeScreen.dart';
import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class PageScreen extends StatelessWidget {
  const PageScreen({Key? key}) : super(key: key);


  void showToast(){
    Fluttertoast.showToast(
        msg: 'Hello',
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,

                ),
                child: const Center(
                  child: Text(
                      'TodoApp',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
              onTap: (){
               navigateTo(context,const  TodoHomeList());
              },
            ),
            const Divider(thickness: 1,),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,

                ),
                child: const Center(
                  child: Text(
                    'Chat App',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              onTap: (){
                navigateTo(context, const JobScreen());
              },
            ),
            const Divider(thickness: 1,),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,

                ),
                child: const Center(
                  child: Text(
                    'World Timer App',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              onTap: (){
                navigateTo(context, const TabBarScreen());
              },
            ),
            const Divider(thickness: 1,),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,

                ),
                child: const Center(
                  child: Text(
                    'Toast',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              onTap: showToast,
            )
          ],
        ),
      ),
    );
  }

}
