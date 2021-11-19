import 'package:amire_sokhan/database/getinfo_json.dart';
import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

drawerInfoScreen(BuildContext context, String key) {
  return FutureBuilder(
    future: getInfoJson(),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return AlertDialog(
          backgroundColor: StateInheritWidget.of(context)!.state.primaryColor[50],
          title: Text(snapshot.data[key]["title"]),
          content: Container(
           
            padding: const EdgeInsets.all(4),
            child: SingleChildScrollView(child: Text(snapshot.data[key]["description"],
            style: const TextStyle(height: 2,),
            textAlign: TextAlign.justify,
            ),
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("خروج"))
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}
