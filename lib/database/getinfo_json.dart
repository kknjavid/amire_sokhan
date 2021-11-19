import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map> getInfoJson() async {
  final jsonFile = await rootBundle.loadString("assets/information.json");
  final decodJson = jsonDecode(jsonFile);
  return decodJson;
}
