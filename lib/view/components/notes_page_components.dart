import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.dart';

Widget customNoteFormField(label, hint, {height= 70.0}) => Container(
  height: height,
  padding: EdgeInsets.only(left: 10, top: 8,),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      border: Border.all(
          width: 2,
        color: Colors.teal
      )
  ),
  child: TextFormField(
    decoration: InputDecoration(
      label: Text(label),
      labelStyle: GoogleFonts.poppins(fontSize: 20, color: darkGrey, fontWeight: FontWeight.w500),
      hintText: hint,
      hintStyle: GoogleFonts.poppins(fontSize: 20, color: darkGrey, fontWeight: FontWeight.w500),
      border: InputBorder.none,
    ),
  ),
);