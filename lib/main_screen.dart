import 'package:amire_sokhan/Screens/components/bottom_bar.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

import 'Screens/drawer/drawer_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final state= StateInheritWidget.of(context)!.state;
    return Scaffold(
      drawer: const DrawerScreen(),
    appBar: AppBar(
   
      title: const Text("امیرِ سخن"),
    ),
    body:state.bodyWidget,
    bottomNavigationBar: const BottomBar(),
    );
  }
}
