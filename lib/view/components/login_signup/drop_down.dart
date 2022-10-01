import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customDropDown({required currentValue, required onChanged, required items}) =>
    DropdownButton(
      value: currentValue,
      icon:
      const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.black),
      borderRadius: BorderRadius.all(
          Radius.circular(10)),
      onChanged: onChanged,
      items: items
    );