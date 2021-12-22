import 'package:amire_sokhan/Screens/drawer/drawer_appinfo_screen.dart';
import 'package:amire_sokhan/Screens/drawer/drawer_setting_screen.dart';
import 'package:amire_sokhan/Screens/drawer/whatsapp_launcher.dart';
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
            const UserAccountsDrawerHeader(
              accountName: Text("امیر سخن"),
              accountEmail: Text("گزیده ای از بیانات نهج البلاغه"),
              // currentAccountPicture: GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const Image(
              //               image: AssetImage("assets/kk.gif"),
              //             )));
              //   },
              //   child: const CircleAvatar(
              //     backgroundImage: AssetImage("assets/kk.gif"),
              //   ),
              // ),
            ),
            
            DrawerView(
              text: "پوسته نرم افزار",
              icon: Icons.settings,
              child: const DrawerSettingScreen(),
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
            TextButton(onPressed: ()async=> await drawerLaunchWhatsApp(), child:ListTile(title: Text("تماس با ما"),leading: Image(image: AssetImage("assets/whatsapp.png"),height: 25,color: StateInheritWidget.of(context)!.state.primaryColor,),) ),
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
      return showDialog(context: context, builder: (context) => child,barrierDismissible: false);
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
