
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/resources/colors.dart';
import 'package:orange_digital_center/view/components/all.dart';

import '../../components/settings_page_components.dart';

class OurPartners extends StatelessWidget {
  OurPartners({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Our Partners", context, noFilter: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xffb9b8b8),
                Color(0xfffdfdfc),
                Color(0xffb9b8b8),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 5),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ODCs",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
