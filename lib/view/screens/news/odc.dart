import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/resources/colors.dart';

class odc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Hero(
                      tag: "ODC",
                      child: Center(
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      left: 7,
                      child: FloatingActionButton(
                        onPressed: () => Navigator.pop(context),
                        elevation: 4,
                        mini: true,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: orange,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(7),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ODCs",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    Text(
                      "2022-07-06",
                      style: GoogleFonts.poppins(color: orange, fontSize: 15),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Text(
                        "ODC Supports All Universties",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
