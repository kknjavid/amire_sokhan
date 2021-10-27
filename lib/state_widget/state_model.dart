import 'package:amire_sokhan/Screens/bookmark_screen.dart';
import 'package:flutter/material.dart';

class StateWidget {
  int index;
  final Widget bodyWidget;

  StateWidget({this.index = 0, this.bodyWidget = const BookmarkScreen()});

  StateWidget copy({int? index, Widget? bodyWidget}) => StateWidget(
    index: index?? this.index,
    bodyWidget: bodyWidget?? this.bodyWidget,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateWidget &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          bodyWidget == other.bodyWidget;

  @override
  int get hashCode => index.hashCode ^ bodyWidget.hashCode;
}
