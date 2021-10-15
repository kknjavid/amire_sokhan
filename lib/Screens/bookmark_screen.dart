import 'package:amire_sokhan/database/db_helper.dart';
import 'package:amire_sokhan/globals.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
     return FutureBuilder(
      future: DbHelper.dbHelper.getAllFavSokhan(),
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
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,color: Colors.teal[500],)),
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