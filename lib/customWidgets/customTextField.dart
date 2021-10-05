

import 'package:flutter/material.dart';
import '../constants.dart';

class customTextFieldWdg extends StatelessWidget {
  final String hint;
  final IconData icon;
  // final Function onClick;
  String _errorMessage(String str)
  {
    switch(hint){
      case "Enter your name" : return 'Name is empty !';
      case "Enter your email" : return 'email is empty !';
      case "Enter your password" : return 'password is empty !';
    }
    return '';
    
  }
  const customTextFieldWdg({required this.icon, required this.hint, /*required this.onClick */});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return _errorMessage(hint);
          }
        },
        obscureText: hint=="Enter your password" ? true: false ,
        // onSaved: onClick(),
        cursorColor: kColorMain,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon ,
            color: kColorMain,
          ),
          filled: true,
          fillColor: kColorTextField,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

