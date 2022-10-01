
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/resources/colors.dart';
import 'package:orange_digital_center/view/components/all.dart';

import '../../components/settings_page_components.dart';

class SupportPage extends StatelessWidget {
  SupportPage({Key? key}) : super(key: key);

  List supportFields = [
    customFormField("Name", icon: Icons.person),
    customFormField("E-Mail", icon: Icons.mail),
    customFormField("What's making you unhappy?", height: 150.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Support", context, noFilter: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: ListView.separated(
                itemBuilder: (Context, index) => supportFields[index],
                separatorBuilder: (context, index) => SizedBox(height: 20,),
                itemCount: supportFields.length,
                shrinkWrap: true,
                //padding: EdgeInsets.only(top: 10),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: orange,
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
