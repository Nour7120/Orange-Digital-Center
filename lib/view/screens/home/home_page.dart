import 'package:flutter/material.dart';
import 'package:orange_digital_center/resources/colors.dart';
import 'package:orange_digital_center/view/components/home_body_components.dart';
import 'package:orange_digital_center/view/screens/home/final_page.dart';
import 'package:orange_digital_center/view/screens/home/lectures_page.dart';
import 'package:orange_digital_center/view/screens/home/midterms_page.dart';
import 'package:orange_digital_center/view/screens/home/sections_page.dart';

import 'events_page.dart';
import 'notes_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    List cards = [
      customGridCard("assets/icons/lecture.svg", "Lectures", 20.0,context, lecturesPage()),
      customGridCard("assets/icons/sections.svg", "Sections",20.0, context, sectionsPage()),
      customGridCard("assets/icons/midterm.svg", "Midterms", 20.0, context, midtermsPage()),
      customGridCard("assets/icons/final.svg", "Finals",20.0, context, finalPage()),
      customGridCard("assets/icons/event.svg", "Events",20.0, context, EventsPage()),
      customGridCard("assets/icons/notes.svg", "Notes", 20.0, context, NotesPage()),
    ];
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText("Orange ", 24.0, orange),
                customText("Digital Center", 24.0)
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            childAspectRatio: 1.4,
            padding: EdgeInsets.all(20),
            children: List.generate(cards.length, (index) => cards[index]),
          ),
        ],
      ),
    );
  }
}
