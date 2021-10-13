import 'package:ecommerce/provider/adminmode.dart';
import 'package:ecommerce/provider/modelhud.dart';
import 'package:ecommerce/screens/admin/adminpage.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
        create: (context) =>ModelHud(),),
        ChangeNotifierProvider<AdminMode>(
        create: (context) =>AdminMode(),),
      ],
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes:
        {
          LoginScreen.id:(context)=>LoginScreen(),
          SignupScreen.id:(context)=>SignupScreen(),
          HomePage.id:(context)=>HomePage(),
          AdminHomePage.id:(context)=>AdminHomePage(),
        },
      ),
    );
  }
}
