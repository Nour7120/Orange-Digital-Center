import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view/screens/settings/our_parteners.dart';
import 'package:orange_digital_center/view/screens/settings/support_page.dart';
import 'package:orange_digital_center/view/screens/settings/terms_conditions.dart';

import '../../../resources/colors.dart';
import '../../components/settings_page_components.dart';
import 'faq_page.dart';


class SettingsPage extends StatelessWidget {

  List<List> tileInfo = [
    ["FAQ", FAQ()],
    ["Terms & Conditions", TermsAndConditions()],
    ["Our Partners", OurPartners()],
    ["Support", SupportPage()],
    ["Log out", SupportPage()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Settings",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (itemContext, index) => reusedListTile(tileInfo[index][0], tileInfo[index][1], context),
                separatorBuilder: (context, index) => Container(
                  color: listTileSeparator,
                  height: 2,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                ),
                itemCount: tileInfo.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
