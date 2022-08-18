
import 'package:eraa_soft/layouts/home_layouts.dart';
import 'package:eraa_soft/modulus/register_screen.dart';

import 'package:eraa_soft/shared/component.dart';
import 'package:eraa_soft/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: height*0.15,),
             Center(
              child:Text(
                  'Cignifi',
                  style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                          fontSize: 50,
                        color: defaultColor
                      )
                  ),),
            ),
            SizedBox(height: height*0.08,),
            const Text(
              'Login to your Account',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.grey

              )),
             SizedBox(height: height*0.03,),

            defaultTextField(
                controller: emailController,
                inputText: TextInputType.emailAddress,
                validator: (value){
                  if(value.isEmpty){
                    return 'Email must not be empty';
                  }
                },
                label: 'Email'),
            const SizedBox(height: 15.0,),
            defaultTextField(
                controller: passwordController,
                inputText: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return 'password must not be empty ';
                  }
                  return null;
                },
                label: 'Password'),
            const SizedBox(height: 35.0,),

            defaultBottom(function: (){

              navigateTo(context, const HomeLayout());
            }, text: 'Sign in'),
             SizedBox(height:height*0.08 ,),

            const Center(
                child:  Text(
                    'or Sign in with',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15
                  ),
                ),

            ),

            SizedBox(height:height*0.04 ,),
            Row(

              children: [
                defaultSocialLogo(image: 'assets/images/google.png',),
                const SizedBox(width: 18,),
                defaultSocialLogo(image: 'assets/images/facebook.png',color: defaultColor),
                const SizedBox(width: 18,),
                defaultSocialLogo(image: 'assets/images/twitter.png',),
              ],
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account ? ',
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 15
                  ),),
                TextButton(
                    onPressed: (){
                      navigateTo(context,const RegisterScreen());
                }, child: const Text('Sign up'))

              ],
            )



          ],

        ),
      ),
    );
  }
}
