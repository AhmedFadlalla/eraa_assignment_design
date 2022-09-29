import 'package:eraa_soft/chat_app/presentation/screen/chat_home_screen.dart';
import 'package:eraa_soft/chat_app/presentation/screen/on_boarding_screen.dart';
import 'package:eraa_soft/modulus/page_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../login_screen.dart';
class SplashBodyView extends StatefulWidget {
  const SplashBodyView({Key? key}) : super(key: key);

  @override
  _SplashBodyViewState createState() => _SplashBodyViewState();
}

class _SplashBodyViewState extends State<SplashBodyView> with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? feedingAnimation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync:this,duration: const Duration(milliseconds: 600) );
    feedingAnimation =Tween<double>(begin: 0.2,end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }
  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: FadeTransition(
        opacity: feedingAnimation!,
        child:  Text(
          'Chaty',
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 50
            )
          ),

        ),
      ),
    );
  }

  void goToNextView() {

    Future.delayed(const Duration(seconds: 3),()
    {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>const ChatHomeScreen()
          )
      );
    });
  }
}
