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
              accountName: Text("کورش کاظمی نیا"),
              accountEmail: Text("kkn.javid@gmail.com"),
              
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/kk.gif"),
              ),
            ),
            DrawerView("تنظیمات", Icons.settings),
            DrawerView("درباره نرم افزار", Icons.book),
            DrawerView("درباره ما", Icons.developer_mode),
          ],
        ),
      ),
    );
  }
}

Widget DrawerView(text,icon) {
  return TextButton(
    onPressed: (){},
    child: ListTile(
      title: Text(text),
      leading: Icon(icon,color: Colors.teal,),
    ),
  );
}
