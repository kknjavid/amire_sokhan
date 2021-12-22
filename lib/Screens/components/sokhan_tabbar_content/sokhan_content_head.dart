// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:amire_sokhan/Screens/components/sokhan_tabbar_content/sokhan_content_body.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
            IconButton(
                onPressed: () {
                  Share.share(
                      "${sokhan.arabic}\n\n${sokhan.farsi}\n\n${sokhan.refrence}\n\n نرم افزار موبایل امیر سخن");
                },
                icon: const Icon(Icons.share)),
            TextButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      Slider(
                        value: provider.state.fontSize,
                        onChanged: (value) {
                          provider.changeFontSize(value);
                        },
                        divisions: 15,
                        max: 40,
                        min: 10,
                        label: provider.state.fontSize.toInt().toString(),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                "اندازه متن",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          title: IconButton(
              onPressed: () {
                provider.updateFavSokhan(sokhan: sokhan, curWidget: this);
              },
              icon: Icon(sokhan.favourit == 0
                  ? Icons.bookmark_border_outlined
                  : Icons.bookmark)),
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
