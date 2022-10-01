import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.dart';

PreferredSizeWidget customAppBar(text, context,
        {noFilter = false, noElevation = false, pop1, pop2, pop3}) =>
    AppBar(
      backgroundColor: Colors.white,
      elevation: noElevation ? 0 : 7,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_outlined),
        color: orange,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: Text(
        text,
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: noFilter
              ? null
              : PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          value: 0,
                          child: Text(
                            pop1,
                            style: GoogleFonts.poppins(),
                          )),
                      PopupMenuItem(
                          value: 1,
                          child: Text(pop2, style: GoogleFonts.poppins())),
                      PopupMenuItem(
                          value: 2,
                          child: Text(pop3, style: GoogleFonts.poppins())),
                    ];
                  },
                  child: SvgPicture.asset(
                    "assets/icons/filter.svg",
                    color: Colors.deepOrange,
                  ),
                ),
        ),
      ],
    );
