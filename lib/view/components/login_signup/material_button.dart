import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/resources/colors.dart';

Widget customMaterialButton({required name, required nameColor, required backgroundColor, required function}) =>
    Container(
  width: double.infinity,
  margin: EdgeInsets.symmetric(horizontal: 15),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: orange, width: 3),
    color: backgroundColor
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      name,
      style: GoogleFonts.poppins(
          color: nameColor,
          fontWeight: FontWeight.bold,
          fontSize: 25),
    ),
  ),
);