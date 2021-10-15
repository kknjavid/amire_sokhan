import 'package:amire_sokhan/Screens/components/bottom_bar.dart';
import 'package:amire_sokhan/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("امیرِ سخن"),
    ),
    body:
    Provider.of<WidgetProvider>(context).widget,
    bottomNavigationBar: const BottomBar(),
    );
  }
}
