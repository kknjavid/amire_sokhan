import 'package:amire_sokhan/Screens/bookmark_screen.dart';
import 'package:amire_sokhan/Screens/components/search_result_com.dart';

import 'package:flutter/material.dart';

class StateWidget {
  final int index;
  final List? allData;
  final Widget bodyWidget;
  final Widget? searchResultCom;
  const StateWidget(
      {this.searchResultCom,
      this.allData,
      this.index = 0,
      this.bodyWidget = const BookmarkScreen()});

  StateWidget copy(
          {int? index,
          Widget? bodyWidget,
          List? allData,
          Widget? searchResultCom}) =>
      StateWidget(
        index: index ?? this.index,
        bodyWidget: bodyWidget ?? this.bodyWidget,
        allData: this.allData ?? allData,
        searchResultCom: searchResultCom ?? Container(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateWidget &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          bodyWidget == other.bodyWidget &&
          allData == other.allData &&
          searchResultCom == other.searchResultCom;

  @override
  int get hashCode =>
      index.hashCode ^
      bodyWidget.hashCode ^
      allData.hashCode ^
      searchResultCom.hashCode;
}
