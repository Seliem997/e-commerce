import 'package:ecommerce/customWidgets/customTextField.dart';
import 'package:ecommerce/customWidgets/logowdg.dart';
import 'package:ecommerce/provider/modelhud.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  final _auth=Auth();
  static String id= 'SignupScreen';
  late String _email, _password,_name;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kColorMain,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHud>(context).isLoading,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                logoNamedWDG(),
                SizedBox(
                  height: height*.10,
                ),
                customTextFieldWdg(icon: Icons.person, hint: "Enter your name", onClick:(value){_name=value!;},),
                SizedBox(
                  height: height*.02,
                ),
                customTextFieldWdg(hint: 'Enter your email',icon: Icons.email,onClick: (value){_email=value!;},),
                SizedBox(
                  height: height*.02,
                ),
                customTextFieldWdg(icon: Icons.lock, hint: 'Enter your password',onClick: (value){_password=value!;},),
                SizedBox(
                  height: height*.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Builder(
                    builder:(context) => ElevatedButton(
                      onPressed: () async
                      {
                        final modelHud= Provider.of<ModelHud>(context,listen: false);
                        modelHud.changeisLoading(true);
                        if(_globalKey.currentState!.validate()) {

                          _globalKey.currentState!.save();
                          print(_email);
                          print(_password);
                          try{
                            final authResult= await _auth.signUp(_email, _password);
                            print(authResult.user.uid);
                            modelHud.changeisLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('You are welcome, $_name')),
                          );
                            Navigator.pushNamed(context, HomePage.id);
                          }on FirebaseException catch(e){
                            print(e.toString());
                            modelHud.changeisLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.message!
                              ),
                            ));
                          }
                          }
                        modelHud.changeisLoading(false);

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
          ),
        )
    );
  }
}

