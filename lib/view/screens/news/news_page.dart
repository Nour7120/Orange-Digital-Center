import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view/screens/news/ODC.dart';

import '../../../resources/colors.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "News",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => odc())),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1.0),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ODCs",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset("assets/icons/share.svg", color: Colors.white,),
                                      Container(height: 25, width: 1, color: Colors.white,),
                                      SvgPicture.asset("assets/icons/copy.svg", color: Colors.white,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Hero(
                              tag: "ODC",
                              child: Image.asset(
                                "assets/images/logo.png",
                              ),
                            ),
                            Text(
                              "ODC Supports All Universties",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
