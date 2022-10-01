import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../view/screens/home/home_page.dart';
import '../../view/screens/news/news_page.dart';
import '../../view/screens/settings/settings_page.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List mainScreens = [
    HomePage(),
    NewsPage(),
    SettingsPage(),
  ];

  void changeIndex(index)
  {
    currentIndex = index;
    emit(navigate());
  }
}
