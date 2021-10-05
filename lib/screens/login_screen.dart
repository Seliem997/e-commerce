import 'dart:ui';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/customWidgets/customTextField.dart';
import 'package:ecommerce/customWidgets/logowdg.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  static String id='LoginScreen';
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double  height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kColorMain,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            logoNamedWDG(),
            SizedBox(
              height: height*.120,
            ),
            customTextFieldWdg(hint: 'Enter your email',icon: Icons.email,),
            SizedBox(
              height: height*.02,
            ),
            customTextFieldWdg(icon: Icons.lock, hint: 'Enter your password'),
            SizedBox(
              height: height*.12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                onPressed: (){
                  if(_globalKey.currentState!.validate()){

                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                child: Text(
                  'Login',
                  // style: TextStyle(
                  //   color: Colors.white
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: height*.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: Text(
                    ' Sign up',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

