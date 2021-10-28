import 'package:amire_sokhan/state_widget/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alldata = StateInheritWidget.of(context)!.state.allData!;

    return ListView.builder(
      itemCount: alldata.length,
      itemBuilder: (BuildContext context, int index) {
        if (alldata.isEmpty || alldata == null) {
          return CircularProgressIndicator();
        } else {
          return Text(alldata
              .where((element) => element.favourit == 1)
              .toList()[index]
              .arabic
              .toString());
        }
      },
    );
  }
}
