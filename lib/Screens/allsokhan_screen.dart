import 'package:amire_sokhan/database/db_helper.dart';
import 'package:amire_sokhan/globals.dart';
import 'package:flutter/material.dart';

class AllSokhanScreen extends StatelessWidget {
  const AllSokhanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbHelper.dbHelper.getAllSokhan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: teal,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: teal[50],
                child: TextButton(
                  child: ListTile(
                    title: Text(snapshot.data[index].arabic),
                    leading: Image.asset(vectorIcon,color: teal[900],),
                  ),
                  onPressed: (){},
                ),
              );
            },
          );
        }
      },
    );
  }
}
