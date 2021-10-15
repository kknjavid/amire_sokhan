
import 'package:amire_sokhan/globals.dart';
import 'package:amire_sokhan/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllSokhanScreen extends StatelessWidget {
  const AllSokhanScreen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  Provider.of<WidgetProvider>(context,listen: false).getAllSokhan,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: teal,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
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
                          snapshot.data[index].favourit == 1
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: teal[500],
                        )),
                  ),
                  onPressed: () {},
                ),
              );
            },
          );
        }
      },
    );
  }
}
