import 'package:amire_sokhan/Screens/components/sokhan_tabbar_content/sokhan_content_head.dart';
import 'package:amire_sokhan/database/db_helper.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class SearchResultCom extends StatelessWidget {
  const SearchResultCom({Key? key, required this.query}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final query;

  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    return FutureBuilder(
      future: DbHelper.dbHelper.searchInAllSokhan(query),
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
                color: provider.state.primaryColor[50],
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SokhanContentHead(
                                sokhan: snapshot.data![index],query: query,)));
                  },
                  child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: provider.state.primaryColor,
                      ),
                      title: Text(
                        snapshot.data![index].arabic.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                ),
              );
            },
          );
        }
      },
    );
  }
}
