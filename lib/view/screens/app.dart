import 'package:flutter/material.dart';
import 'package:orange_digital_center/view/screens/home_layout.dart';
import 'package:orange_digital_center/view/screens/login_signup/login_screen.dart';
import 'package:orange_digital_center/view/screens/splash_screen.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
