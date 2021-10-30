import 'package:amire_sokhan/state_widget/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    return Column(
      children: [
        Container(
            child: Form(
                child: TextField(
              onChanged: (value){
                provider.searchQuery(value);
              },
              decoration: const InputDecoration(
                  hintText: "متن را وارد کنید", label: Text('جستجو')),
            )),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        Flexible(
          child: Container(
            child: provider.state.searchResultCom!,
          ),
        )
      ],
    );
  }
}
