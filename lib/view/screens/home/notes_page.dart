import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view/screens/home/add_note.dart';

import '../../components/all.dart';

class NotesPage extends StatelessWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Notes", context, noFilter: true, noElevation: true),
      body: Center(
        child: Text(
          "There's No Data To Show",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNote(),
          ),
        ),
        backgroundColor: Colors.blueGrey[300],
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
