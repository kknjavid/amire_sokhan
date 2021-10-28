import 'package:amire_sokhan/database/db_helper.dart';
import 'package:amire_sokhan/state_widget/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class AllSokhanScreen extends StatelessWidget {
  const AllSokhanScreen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    final alldata = StateInheritWidget.of(context)!.state.allData;
    return ListView.builder(
      itemCount: alldata!.length,
      itemBuilder: (BuildContext context, int index) {
        if (alldata.isEmpty) {
          return CircularProgressIndicator();
        } else {
          return TextButton(child: ListTile(title: Text(alldata[index].arabic.toString()),),onPressed: (){},);
        }
      },
    );
  }
}
