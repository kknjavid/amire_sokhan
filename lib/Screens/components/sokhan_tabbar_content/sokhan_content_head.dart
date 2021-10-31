import 'package:amire_sokhan/Screens/components/sokhan_tabbar_content/sokhan_content_body.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class SokhanContentHead extends StatelessWidget {
  const SokhanContentHead({Key? key, this.sokhan}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final sokhan;
  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(
              onPressed: () {
                provider.updateFavSokhan(sokhan:sokhan, curWidget: this);
              },
              icon: Icon(sokhan.favourit == 0
                  ? Icons.bookmark_add
                  : Icons.bookmark_remove)),
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
          Container(child: SokhanContentBody(content: sokhan.arabic, title: "متن")),
          SokhanContentBody(content: sokhan.farsi, title: "ترجمه"),
          SokhanContentBody(content: sokhan.refrence, title: "منبع"),
        ]),
      ),
    );
  }
}