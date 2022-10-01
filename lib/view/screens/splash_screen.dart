
import 'package:flutter/material.dart';
import 'package:orange_digital_center/resources/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'login_signup/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LinearPercentIndicator(
                  backgroundColor: grey,
                  width: MediaQuery.of(context).size.width - 40,
                  progressColor: orange,
                  lineHeight: 10.0,
                  animation: true,
                  animationDuration: 1600,
                  barRadius: Radius.circular(10),
                  percent: 1.0,
                  onAnimationEnd: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

