import 'package:eraa_soft/shared/component.dart';
import 'package:eraa_soft/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../layouts/home_layouts.dart';
import 'home_page.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var confirmPasswordController=TextEditingController();
    var height=MediaQuery.of(context).size.height;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 20,),
              InkWell(
                  child:  const Icon(Icons.arrow_back),
                onTap: (){
                    navigateTo(context,const LoginScreen());
                },
              ),
              SizedBox(height: height*0.06,),
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
                  'Create your Account',
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
              const SizedBox(height: 15.0,),
              defaultTextField(
                  controller: confirmPasswordController,
                  inputText: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'password must not be empty ';
                    }
                    return null;
                  },
                  label: 'Confirm Password'),
              const SizedBox(height: 35.0,),

              defaultBottom(function: (){

                if(passwordController.text==confirmPasswordController.text){
                  // navigateTo(context, const HomeLayout());
                }

              }, text: 'Sign up'),
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







            ],

          ),
        ),
      ),
    );
  }
}
