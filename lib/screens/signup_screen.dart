import 'package:ecommerce/customWidgets/customTextField.dart';
import 'package:ecommerce/customWidgets/logowdg.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  // final _auth=Auth();
  static String id= 'SignupScreen';
  // late String _email, _password;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kColorMain,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: [
              logoNamedWDG(),
              SizedBox(
                height: height*.10,
              ),
              customTextFieldWdg(icon: Icons.person, hint: "Enter your name", /*onClick:(){},*/),
              SizedBox(
                height: height*.02,
              ),
              customTextFieldWdg(hint: 'Enter your email',icon: Icons.email,/*onClick: (value){_email=value;},*/),
              SizedBox(
                height: height*.02,
              ),
              customTextFieldWdg(icon: Icons.lock, hint: 'Enter your password',/*onClick: (value){_password=value;},*/),
              SizedBox(
                height: height*.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                  onPressed: () async
                  {
                    if(_globalKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      /*_globalKey.currentState!.save();
                      print(_email);
                      print(_password);
                      final authResult= await _auth.signUp(_email, _password);
                      print(authResult.user.uid);*/
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
                    'Sign up',
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
                    'Do have an account ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      ' Login',
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

