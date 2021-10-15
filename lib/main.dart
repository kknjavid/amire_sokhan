// ignore_for_file: prefer_const_constructors

import 'package:amire_sokhan/globals.dart';
import 'package:amire_sokhan/main_screen.dart';
import 'package:amire_sokhan/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => WidgetProvider(),
    child: const App(),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        Locale('fa', ''), // fa
      ],

      theme: ThemeData(
        primarySwatch: teal,
        fontFamily: "yekan",
      ),
      home: MainScreen(),
    );
  }
}
