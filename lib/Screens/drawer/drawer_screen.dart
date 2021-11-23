import 'package:amire_sokhan/Screens/drawer/drawer_appinfo_screen.dart';
import 'package:amire_sokhan/Screens/drawer/drawer_setting_screen.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("کورش کاظمی نیا"),
              accountEmail: const Text("kkn.javid@gmail.com"),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Image(
                            image: AssetImage("assets/kk.gif"),
                          )));
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/kk.gif"),
                ),
              ),
            ),
            DrawerView(
              text: "تنظیمات",
              icon: Icons.settings,
              child: const drawerSettingScreen(),
              context: context,
            ),
            DrawerView(
                text: "درباره نرم افزار",
                icon: Icons.book,
                context: context,
                child: drawerInfoScreen(context, "appinfo"),
                ),
            DrawerView(
                text: "درباره ما",
                icon: Icons.developer_mode,
                context: context,
                child: drawerInfoScreen(context,"devinfo"),),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
DrawerView({required text, required icon, required child, required context}) {
  return TextButton(
    onPressed: () async {
      return showDialog(context: context, builder: (context) => child);
    },
    child: ListTile(
      title: Text(text),
      leading: Icon(
        icon,
        color: StateInheritWidget.of(context)!.state.primaryColor,
      ),
    ),
  );
}
