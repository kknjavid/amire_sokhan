import 'package:amire_sokhan/database/db_helper.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

import 'components/sokhan_tabbar_content/sokhan_content_head.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    var query = provider.state.queryMethod ?? DbHelper.dbHelper.getAllFavSokhan();
    return FutureBuilder(
      future: query,
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
                color:provider.state.primaryColor[50],
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SokhanContentHead(
                                sokhan: snapshot.data![index])));
                  },
                  child: ListTile(
                    leading: Image(
                      image: const AssetImage("assets/vector.png"),
                      color: provider.state.primaryColor,
                    ),
                    title: Text(
                      snapshot.data![index].arabic.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        provider.updateFavSokhan(
                            sokhan: snapshot.data![index],
                            curWidget: this,
                            queryMethod: DbHelper.dbHelper.getAllFavSokhan());
                      },
                      icon: Icon(
                        Icons.bookmark_remove_sharp,
                        color: provider.state.primaryColor,
                      ),
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
