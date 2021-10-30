import 'package:amire_sokhan/database/db_helper.dart';
import 'package:flutter/material.dart';

import 'components/sokhan_tabbar_content/sokhan_content_head.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbHelper.dbHelper.getAllFavSokhan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text("هیچ نشان شده ای وجود ندارد"),
          );
        } else {
           return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
                color: Colors.teal[50],
                child: TextButton(
                  onPressed: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SokhanContentHead(
                                sokhan: snapshot.data![index])));
                  }
                  ,
                  child: ListTile(
                      leading: const Image(image: AssetImage("assets/vector.png"),color: Colors.teal,),
                      title: Text(snapshot.data![index].arabic.toString()),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_remove_sharp,color: Colors.teal,),
                        ),
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
