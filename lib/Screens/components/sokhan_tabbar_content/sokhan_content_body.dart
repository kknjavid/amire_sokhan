import 'package:flutter/material.dart';

class SokhanContentBody extends StatelessWidget {
  const SokhanContentBody({Key? key, this.content, this.title}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final content;
  // ignore: prefer_typing_uninitialized_variables
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: content!=null?SelectableText(content):null,
    );
  }
}
