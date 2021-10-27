import 'package:amire_sokhan/database/db_helper.dart';
import 'package:flutter/material.dart';

class AllSokhanScreen extends StatelessWidget {
  const AllSokhanScreen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("data"));
    // return FutureBuilder(
    //   future: DbHelper.dbHelper.getAllSokhan(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (!snapshot.hasData) {
    //       return const CircularProgressIndicator();
    //     }
    //     if (snapshot.data!.isEmpty) {
    //       return Text("دیتایی وجود ندارد");
    //     } else {
    //       return ListView.builder(
    //         itemCount: snapshot.data!.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return ListTile(title: Text(snapshot.data[index].arabic.toString()),);
    //         },
    //       );
    //     }
    //   },
    // );
  }
}
