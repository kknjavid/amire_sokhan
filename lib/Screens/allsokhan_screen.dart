import 'package:amire_sokhan/Screens/components/sokhan_tabbar_content/sokhan_content_head.dart';
import 'package:amire_sokhan/database/db_helper.dart';
import 'package:flutter/material.dart';

class AllSokhanScreen extends StatelessWidget {
  const AllSokhanScreen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbHelper.dbHelper.getAllSokhan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text("موردی یافت نشد"),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
                color: Colors.teal[50],
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SokhanContentHead(
                                sokhan: snapshot.data![index])));
                  },
                  child: ListTile(
                    leading: const Image(
                      image: AssetImage("assets/vector.png"),
                      color: Colors.teal,
                    ),
                    title: Text(snapshot.data![index].arabic.toString()),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
