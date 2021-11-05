import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

drawerSettingScreen(context) {
  final provider = StateInheritWidget.of(context)!;
  return AlertDialog(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 40,
    ),
    title: const Text("تنظیمات"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("سایز فونت"),
        const SizedBox(height: 40),
        Slider(
          value: 20,
          max: 30,
          min: 10,
          onChanged: (value) {},
        ),
        const SizedBox(height: 40),
        const Text("پوسته نرم افزار"),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            themeItem(provider: provider, color: Colors.teal),
            themeItem(provider: provider, color: Colors.indigo),
          ],
        ),
      ],
    ),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("خروج")),
    ],
  );
}

GestureDetector themeItem({required color, required provider}) {
  return GestureDetector(
    child: CircleAvatar(
      backgroundColor: color,
    ),
    onTap: () {
      provider.changeColor(color);
    },
  );
}
