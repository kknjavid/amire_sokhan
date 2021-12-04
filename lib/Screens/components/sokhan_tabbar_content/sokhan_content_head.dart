// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:amire_sokhan/Screens/components/sokhan_tabbar_content/sokhan_content_body.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class SokhanContentHead extends StatelessWidget {
  const SokhanContentHead({
    Key? key,
    this.sokhan,
    this.query,
  }) : super(key: key);
  final sokhan;
  final query;
  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Slider(
              value: provider.state.fontSize,
              onChanged: (value) {
                provider.changeFontSize(value);
              },
              divisions: 10,
              max: 32,
              min: 12,
              label:provider.state.fontSize.toString(),
              inactiveColor: Colors.white.withOpacity(.6),
              activeColor: Colors.white,
            ),
          ],
          title: IconButton(
              onPressed: () {
                provider.updateFavSokhan(sokhan: sokhan, curWidget: this);
              },
              icon: Icon(sokhan.favourit == 0
                  ? Icons.bookmark
                  : Icons.bookmark_border_outlined)),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "متن",
              ),
              Tab(
                text: "ترجمه",
              ),
              Tab(
                text: "منبع",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          SokhanContentBody(
            content: sokhan.arabic,
            title: "متن",
            query: query,
          ),
          SokhanContentBody(
            content: sokhan.farsi,
            title: "ترجمه",
            query: query,
          ),
          SokhanContentBody(
            content: sokhan.refrence,
            title: "منبع",
            query: query,
          ),
        ]),
      ),
    );
  }
}
