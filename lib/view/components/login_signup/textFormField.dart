import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



Widget customTextFormField({required name, required isSuffixIcon, controller, visible = true, function, icon, iconColor}) => TextFormField(
  obscureText: !visible,

  decoration: InputDecoration(
    label: Text(
      name,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    suffixIcon: isSuffixIcon? IconButton(
      onPressed: function,
      icon: Icon(
          icon
      ),
      color: iconColor
    ): null,
  ),
  controller: controller,
);


