import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/resources/colors.dart';

Widget customText(text, font, [color]) => Text(
      text,
      style: GoogleFonts.poppins(
          color: color, fontSize: font, fontWeight: FontWeight.bold),
    );

Widget customGridCard(icon, text, font, context, page) => GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  },
  child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: grey,
              child: SvgPicture.asset(
                icon,
                height: 40,
                color: text == "Sections" ? orange : null,
              ),
            ),
            SizedBox(height: 15),
            customText(text, font, orange),
          ],
        ),
      ),
    );

Widget customListCard({required lectureName, required dayLabel, required day, required startTime, required EndTime}) => Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lectureName,
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(Icons.timer),
                    Text(
                      "2hrs",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customListColumn(
                  dayLabel,
                  "assets/icons/event.svg",
                  day,
                  Colors.black,
                ),
                customListColumn(
                  " Start Time",
                  "assets/icons/time.svg",
                  startTime,
                  green,
                ),
                customListColumn(
                  " End Time",
                  "assets/icons/time.svg",
                  EndTime,
                  red,
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget customListColumn(label, iconPath, iconLabel, iconColor) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              color: iconColor,
            ),
            Text(
              iconLabel,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
