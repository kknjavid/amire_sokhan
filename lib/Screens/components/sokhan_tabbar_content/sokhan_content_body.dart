import 'package:amire_sokhan/provider/state_inherit_wiget.dart';
import 'package:flutter/material.dart';

class SokhanContentBody extends StatelessWidget {
  const SokhanContentBody({Key? key, this.content, this.title, this.query})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final content;
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final query;
  @override
  Widget build(BuildContext context) {
    final provider = StateInheritWidget.of(context)!;
    return Container(
      color:provider.state.primaryColor[50],
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: content != null
          ? SelectableText.rich(
              query==null?TextSpan(text:content):
              TextSpan(children: highlightOccurrences(content, query)),
              style: const TextStyle(
                height: 2,
              ),
              textAlign: TextAlign.justify,
            )
          : null,
    );
  }
}

//.......................................................................
//.......................................................................
//.......................................................................
//.......................................................................
//.......................................................................

List<TextSpan> highlightOccurrences(String source, String query) {
  // ignore: unnecessary_null_comparison
  if (query == null ||
      query.isEmpty ||
      !source.toLowerCase().contains(query.toLowerCase())) {
    return [TextSpan(text: source)];
  }
  final matches = query.toLowerCase().allMatches(source.toLowerCase());

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];
  for (var i = 0; i < matches.length; i++) {
    final match = matches.elementAt(i);

    if (match.start != lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));
    }

    children.add(TextSpan(
      text: source.substring(match.start, match.end),
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red,),
    ));

    if (i == matches.length - 1 && match.end != source.length) {
      children.add(TextSpan(
        text: source.substring(match.end, source.length),
      ));
    }

    lastMatchEnd = match.end;
  }
  return children;
}
