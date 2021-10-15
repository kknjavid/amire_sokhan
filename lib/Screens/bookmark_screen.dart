import 'package:amire_sokhan/globals.dart';
import 'package:amire_sokhan/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return FutureBuilder(
      future: Provider.of<WidgetProvider>(context).getAllFavSokhan,
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
                    leading: Image.asset(
                      vectorIcon,
                      color: teal[900],
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Provider.of<WidgetProvider>(context,listen: false )
                        .updateBookmark(snapshot.data[index]);
                        },
                        icon: Icon(
                          Icons.bookmark,
                          color: Colors.teal[500],
                        )),
                  ),
                  onPressed: () {
                    
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
