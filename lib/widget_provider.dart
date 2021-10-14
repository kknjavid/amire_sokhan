import 'package:amire_sokhan/Screens/allsokhan_screen.dart';
import 'package:amire_sokhan/Screens/bookmark_screen.dart';
import 'package:amire_sokhan/Screens/search_screen.dart';
import 'package:flutter/material.dart';

class WidgetProvider extends ChangeNotifier {
  int index = 0;
  Widget widget = BookmarkScreen();

  void changeWidget(int value) {
    List<Widget> widgetList = [const BookmarkScreen(),const AllSokhanScreen(), const SearchScreen()];
    index = value;
    widget = widgetList[index];
    notifyListeners();
  }
}
