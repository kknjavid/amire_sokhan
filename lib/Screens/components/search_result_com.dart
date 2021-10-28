import 'package:amire_sokhan/database/db_helper.dart';
import 'package:flutter/material.dart';

class SearchResultCom extends StatelessWidget {
  const SearchResultCom({Key? key, required this.query}) : super(key: key);
  final query;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbHelper.dbHelper.searchInAllSokhan(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text("موردی یافت نشد"),);
            } else {
              return ListTile(
                  title: Text(snapshot.data![index].arabic.toString()));
            }
          },
        );
      },
    );
  }
}
