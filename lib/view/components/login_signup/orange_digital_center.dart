import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget orangeDigitalCenter() => Padding(
  padding: const EdgeInsets.only(top: 15.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Orange ",
        style: GoogleFonts.poppins(
            color: Colors.deepOrangeAccent,
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
      Text(
        "Digital Center",
        style: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
);