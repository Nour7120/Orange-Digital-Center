import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:toggle_list/toggle_list.dart';

ToggleListItem customToggleItem({title, content, context}) => ToggleListItem(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RichText(
          text: HTML.toTextSpan(
            context,
            title,
            defaultTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none
            ),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: HTML.toTextSpan(
            context,
            content,
            defaultTextStyle: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none
            ),
          ),
        ),
      ),
      itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromRGBO(158, 158, 158, 1.0)),
      headerDecoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Color.fromRGBO(254, 103, 0, 1.0),
      ),
    );
