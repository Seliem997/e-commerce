import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);
  static String id='AdminHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMain,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          ElevatedButton(
              onPressed: (){

              },
              child: Text(
                'Add Product',
              )),
          ElevatedButton(
              onPressed: (){

              },
              child: Text(
                'Edit Product',
              )),
          ElevatedButton(
              onPressed: (){

              },
              child: Text(
                'view orders',
              )),
        ],
      ),
    );
  }
}
