import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {
  static Future<SharedPreferences> get _shared async =>
      await SharedPreferences.getInstance();
  static Future<MaterialColor> getColor() async {
    final sp = await _shared;
    final res = sp.getInt("colorIndex") ?? 0;
    List colors = [Colors.teal, Colors.indigo, Colors.purple];
    final color = colors[res];
    return color;
  }

  static Future<bool> setColor(int colorIndex) async {
    final sp = await _shared;
    final res = sp.setInt("colorIndex", colorIndex);
    return res;
  }
}
