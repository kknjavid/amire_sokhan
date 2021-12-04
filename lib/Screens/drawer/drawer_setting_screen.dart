import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class DrawerSettingScreen extends StatelessWidget {
  const DrawerSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      title: const Text("پوسته نرم افزار"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              themeItem(provider: provider, color: Colors.teal,colorIndex: 0),
              themeItem(provider: provider, color: Colors.indigo,colorIndex: 1),
              themeItem(provider: provider, color: Colors.purple,colorIndex: 2),
            ],
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("خروج")),
      ],
    );
  }
}

Widget themeItem({required color, required provider, required colorIndex}) {
  return IconButton(
    iconSize: 40,
    splashColor: color,
    icon: CircleAvatar(
      
      backgroundColor: color,
    ),
    onPressed: () {
      provider.changeTheme(color, colorIndex);
    },
  );
}
