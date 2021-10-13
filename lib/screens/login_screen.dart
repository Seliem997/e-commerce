import 'dart:ui';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/customWidgets/customTextField.dart';
import 'package:ecommerce/customWidgets/logowdg.dart';
import 'package:ecommerce/provider/adminmode.dart';
import 'package:ecommerce/provider/modelhud.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'admin/adminpage.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  late String _email, _password, _name;
  final _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final String adminPassword = 'admin123';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                  height: height * .120,
                ),
                customTextFieldWdg(
                  hint: 'Enter your email',
                  icon: Icons.email,
                  onClick: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(
                  height: height * .02,
                ),
                customTextFieldWdg(
                    icon: Icons.lock,
                    hint: 'Enter your password',
                    onClick: (value) {
                      _password = value!;
                    }),
                SizedBox(
                  height: height * .12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        _validate(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Login',
                        // style: TextStyle(
                        //   color: Colors.white
                        // ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: height * .06,
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
                      onTap: () {
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * .06, horizontal: height * .1),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AdminMode>(context, listen: false)
                                .changeisAdmin(true);
                          },
                          child: Text(
                            'I\'m an admin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? kColorMain
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AdminMode>(context, listen: false)
                                .changeisAdmin(false);
                          },
                          child: Text(
                            'i\'m a User',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? Colors.white
                                  : kColorMain,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeisLoading(true);
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (_password == adminPassword) {
          try {
            await _auth.signIn(_email, _password);
            modelHud.changeisLoading(false);
            Navigator.pushNamed(context, AdminHomePage.id);
          } on FirebaseException catch (e) {
            modelHud.changeisLoading(false);
            print(e.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message!)),
            );
          }
        } else {
          print('Something is Wrong');
          modelHud.changeisLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something is Wrong')),
          );
        }
      } else {
        try {
          await _auth.signIn(_email, _password);
          modelHud.changeisLoading(false);
          Navigator.pushNamed(context, HomePage.id);
        } on FirebaseException catch (e) {
          print(e.toString());
          modelHud.changeisLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message!)),
          );
        }
      }
    }
    modelHud.changeisLoading(false);
  }
}
