import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view/screens/login_signup/login_screen.dart';
import 'package:orange_digital_center/view_model/bloc/sign_up_cubit/sign_up_cubit.dart';

import '../../../resources/colors.dart';
import '../../components/login_signup/material_button.dart';
import '../../components/login_signup/orange_digital_center.dart';
import '../../components/login_signup/textFormField.dart';

class SignUpScreen extends StatelessWidget {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit()..getUniversitiesAndGrades(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          SignUpCubit obj = BlocProvider.of(context);
          List labels = [
            ["Name", obj.name],
            ["E-Mail", obj.email],
            ["Password", obj.pass],
            ["Phone Number", obj.phone],
          ];
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
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
                      // Sign Up text.
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                      ),
                      // ListView for textFormFields.
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.separated(
                          itemBuilder: (context, index) => customTextFormField(
                              controller: labels[index][1],
                              name: labels[index][0],
                              iconColor: orange,
                              icon: Icons.remove_red_eye,
                              isSuffixIcon:
                                  labels[index] == "Password" ? true : false),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                          itemCount: labels.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Gender",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton(
                                    value: gender,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    onChanged: (value) {},
                                    items: ["Male", "Female"]
                                        .map<DropdownMenuItem>((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "University",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: obj.universities == null
                                      ? CircularProgressIndicator()
                                      : DropdownButton(
                                          value: obj.currentUniversityItem,
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          onChanged: (value) => obj.selectUniversityItem(value),
                                          items: obj.universities!
                                              .map<DropdownMenuItem>((value) {
                                            return DropdownMenuItem(
                                              value: value.name,
                                              child: Text(value.name!),
                                            );
                                          }).toList(),
                                        ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Grade",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: obj.grades == null
                                      ? CircularProgressIndicator()
                                      : DropdownButton(
                                          value: obj.currentGradeItem,
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          onChanged: (value) => obj.selectGradeItem(value),
                                          items: obj.grades!
                                              .map<DropdownMenuItem>((value) {
                                            return DropdownMenuItem(
                                              value: value.grade,
                                              child: Text(value.grade!),
                                            );
                                          }).toList(),
                                        ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      customMaterialButton(
                        name: "Sign Up",
                        backgroundColor: orange,
                        nameColor: Colors.white,
                        function: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                          obj.signUp(context);
                        },
                      ),
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
                      customMaterialButton(
                        name: "Login",
                        backgroundColor: Colors.white,
                        nameColor: orange,
                        function: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
