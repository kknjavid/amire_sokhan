// ignore_for_file: prefer_const_constructors

import 'package:amire_sokhan/globals.dart';
import 'package:amire_sokhan/main_screen.dart';
import 'package:amire_sokhan/state_widget/state_inherit_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MainStateful(
      child: Builder(builder: (context) {
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
      }),
    );
  }
}
