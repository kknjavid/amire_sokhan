import 'package:amire_sokhan/Screens/components/bottom_bar.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

import 'Screens/drawer_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final wBody= StateInheritWidget.of(context)!.state.bodyWidget;
    return Scaffold(
      drawer: const DrawerScreen(),
    appBar: AppBar(
   
      title: const Text("امیرِ سخن"),
    ),
    body:
    wBody,
    bottomNavigationBar: const BottomBar(),
    );
  }
}
