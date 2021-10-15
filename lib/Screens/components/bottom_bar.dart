import 'package:amire_sokhan/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.teal,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: Provider.of<WidgetProvider>(context).index,
      onTap: (value) {
        if (value >= 3) {
          SystemNavigator.pop();
        } else {
          Provider.of<WidgetProvider>(context,listen: false).changeWidgetFromBottomBar(value);
        }
      },
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        bottomBarItem("نشان شده", Icons.bookmark),
        bottomBarItem("فهرست مطالب", Icons.auto_stories_rounded),
        bottomBarItem("جستجو", Icons.search),
        bottomBarItem("خروج", Icons.exit_to_app),
      ],
    );
  }
}

BottomNavigationBarItem bottomBarItem(String lable, IconData icon) {
  return BottomNavigationBarItem(
    label: lable,
    icon: Icon(icon),
  );
}
