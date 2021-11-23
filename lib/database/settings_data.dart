
import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {
  static SharedPreferences? _pref;
  static Future _init() async => _pref = await SharedPreferences.getInstance();
  static Future changeFont(double value) async {
    if (_pref == null) {
      _init();
    }
    await _pref!.setDouble("size", value);
  }

  static double get fontSize => _pref!.getDouble("size")??20;
}
