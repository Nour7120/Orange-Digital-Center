import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/resources/colors.dart';
import 'package:orange_digital_center/view/screens/login_signup/signup_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../view_model/bloc/login_cubit.dart';
import '../../components/login_signup/material_button.dart';
import '../../components/login_signup/orange_digital_center.dart';
import '../../components/login_signup/textFormField.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit visible = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Orange Digital Center Header.
                      orangeDigitalCenter(),
                      SizedBox(
                        height: 80,
                      ),
                      // Login Text.
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                      ),
                      // E-Mail
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: customTextFormField(
                            name: "E-Mail",
                            isSuffixIcon: false,
                            controller: visible.email),
                      ),
                      // Password
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 15, right: 15, bottom: 8),
                        child: customTextFormField(
                          icon: visible.visible? Icons.remove_red_eye: Icons.visibility_off,
                            iconColor: Colors.deepOrangeAccent,
                          function: () => visible.isVisible(),
                            visible: visible.visible,
                            name: "Password",
                            isSuffixIcon: true,
                            controller: LoginCubit.get(context).pass),
                      ),
                      // Forgot Password?
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                              color: Colors.deepOrangeAccent,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Login Button.

                      customMaterialButton(
                        name: "Login",
                        nameColor: Colors.white,
                        backgroundColor: orange,
                        function: () {
                          LoginCubit.get(context).login(context);
                          // showTopSnackBar(
                          //   context,
                          //   CustomSnackBar.success(
                          //     message:
                          //     "Login Success",
                          //   ),
                          // );
                        },
                      ),
                      // OR
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.grey,
                              height: 2,
                              width: 150,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "OR",
                                style: GoogleFonts.poppins(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              height: 2,
                              width: 150,
                            ),
                          ],
                        ),
                      ),
                      // Sign Up Button.
                      customMaterialButton(
                        name: "Sign Up",
                        nameColor: orange,
                        backgroundColor: Colors.white,
                        function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
