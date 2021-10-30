import 'package:amire_sokhan/Screens/components/sokhan_tabbar_content/sokhan_content_body.dart';
import 'package:flutter/material.dart';

class SokhanContentHead extends StatelessWidget {
  const SokhanContentHead({Key? key, this.sokhan}) : super(key: key);
  final sokhan;
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(onPressed: (){},icon: const Icon(Icons.bookmark_add)),
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
          SokhanContentBody(content: sokhan.arabic, title:"متن"),
          SokhanContentBody(content: sokhan.farsi, title:"ترجمه"),
          SokhanContentBody(content: sokhan.refrence, title:"منبع"),
        ]),
      ),
    );
  }
}
