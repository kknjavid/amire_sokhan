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
      color: Colors.teal[50],
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: content!=null?SelectableText(content,style: const TextStyle(height: 2,),textAlign: TextAlign.justify,):null,
    );
  }
}
