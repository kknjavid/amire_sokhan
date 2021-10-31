import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.teal,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: provider.state.index,
      onTap: (value) {
        if (value >= 3) {
          SystemNavigator.pop();
        } else {
          provider.navigatePageFromBottomBar(value);
        }
      },
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
