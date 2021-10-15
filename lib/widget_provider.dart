import 'package:amire_sokhan/Screens/allsokhan_screen.dart';
import 'package:amire_sokhan/Screens/bookmark_screen.dart';
import 'package:amire_sokhan/Screens/search_screen.dart';
import 'package:amire_sokhan/database/db_helper.dart';
import 'package:flutter/material.dart';

class WidgetProvider extends ChangeNotifier {
  var getAllFavSokhan = DbHelper.dbHelper.getAllFavSokhan();
  var getAllSokhan = DbHelper.dbHelper.getAllSokhan();
  var updateFavSokhan = DbHelper.dbHelper.updateFavSokhan;
  // ignore: prefer_final_fields
  List<Widget> _widgetList = [
    const BookmarkScreen(),
    const AllSokhanScreen(),
    const SearchScreen()
  ];

/*



*/

  int index = 0;
  Widget widget = const BookmarkScreen();

  void changeWidgetFromBottomBar(int value) {
    index = value;
    widget = _widgetList[index];
    notifyListeners();
  }

  void updateBookmark(var sokhan) {
    updateFavSokhan(sokhan);
    getAllFavSokhan = DbHelper.dbHelper.getAllFavSokhan();
    getAllSokhan = DbHelper.dbHelper.getAllSokhan();
    notifyListeners();
  }
}
