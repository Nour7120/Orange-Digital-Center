import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view/components/home_body_components.dart';
import 'package:orange_digital_center/view/components/notes_page_components.dart';

import '../../components/all.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  List notesFields = [
    customNoteFormField("Title", "Enter Title"),
    customNoteFormField("Date", "Enter Date"),
    customNoteFormField("Note", "Enter Note", height: 150.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Note", context, noElevation: true, noFilter: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 30),
              child: ListView.separated(
                itemBuilder: (Context, index) => notesFields[index],
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: notesFields.length,
                shrinkWrap: true,
                //padding: EdgeInsets.only(top: 10),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueGrey),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.black),
                  SizedBox(width: 10,),
                  Text("Add", style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
