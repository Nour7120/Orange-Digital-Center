import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view/screens/login_signup/login_screen.dart';

import '../../resources/colors.dart';

Widget reusedListTile(text, page, context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () => text == "Log out"
            ? showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20
                  ),
                      title: Text(
                        "Logout",
                        style: GoogleFonts.poppins(),
                      ),
                      content:
                          Text("Are you sure?", style: GoogleFonts.poppins(fontSize: 15)),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: orange, width: 3),
                                  color: Colors.white
                              ),
                              child: MaterialButton(
                                onPressed: ()=> Navigator.pop(context),
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.poppins(
                                      color: orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: orange, width: 3),
                                  color: orange
                              ),
                              child: MaterialButton(
                                onPressed: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),),
                                child: Text(
                                  "Sure",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
            : Navigator.push(
                context, MaterialPageRoute(builder: (context) => page)),
        child: ListTile(
            title: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios)),
      ),
    );

Widget customFormField(hint, {icon, height = 70.0}) => TextFormField(
  decoration: InputDecoration(
    prefixIcon: icon == null? null: Icon(
      icon,
      color: darkGrey,
    ),
    hintText: hint,
    hintStyle: GoogleFonts.poppins(
        fontSize: 20, color: darkGrey, fontWeight: FontWeight.w500),
    enabledBorder:OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 3.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder:OutlineInputBorder(
      borderSide: const BorderSide(color: orange, width: 3.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  maxLines: icon != null? null: 8,
);
