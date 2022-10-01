import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orange_digital_center/resources/colors.dart';

import '../../view_model/bloc/home_layout_cubit.dart';



class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create object from our cubit to be built.
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 30,
                    blurStyle: BlurStyle.outer
                ),
              ],),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 8),
                child: GNav(
                  gap: 8,
                  activeColor: orange,
                  tabBackgroundColor: grey,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: "Home",
                    ),
                    GButton(
                      icon: Icons.newspaper_outlined,
                      text: "News",
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: "Settings",
                    ),
                  ],
                  selectedIndex: HomeLayoutCubit.get(context).currentIndex,
                  onTabChange: (index) {
                    HomeLayoutCubit.get(context).changeIndex(index);
                  },
                ),
              ),
            ),
            body:HomeLayoutCubit.get(context).mainScreens[HomeLayoutCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}

