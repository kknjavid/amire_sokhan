import 'package:amire_sokhan/Screens/bookmark_screen.dart';

import 'package:flutter/material.dart';

class StateWidget {
  final int index;
  final Widget bodyWidget;
  final Widget? searchResultCom;
  final dynamic primaryColor ;
  // ..........updataFavSokhan
  final Widget? curWidget;
  final Future? queryMethod;
  //........
  const StateWidget(
      {this.queryMethod,
      this.primaryColor= Colors.teal,
      this.curWidget,
      this.searchResultCom,
      this.index = 0,
      this.bodyWidget = const BookmarkScreen()});

  StateWidget copy({
    int? index,
    Widget? bodyWidget,
    List? allData,
    Widget? searchResultCom,
    Future? queryMethod,
    Widget? curWidget,
     primaryColor,
  }) =>
      StateWidget(
        index: index ?? this.index,
        bodyWidget: bodyWidget ?? this.bodyWidget,
        searchResultCom: searchResultCom ?? Container(),
        queryMethod: queryMethod,
        curWidget: curWidget,
        primaryColor: primaryColor?? this.primaryColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateWidget &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          bodyWidget == other.bodyWidget &&
          searchResultCom == other.searchResultCom &&
          queryMethod == other.queryMethod &&
          curWidget == other.curWidget&&
          primaryColor==other.primaryColor;

  @override
  int get hashCode =>
      index.hashCode ^
      bodyWidget.hashCode ^
      searchResultCom.hashCode ^
      queryMethod.hashCode ^
      curWidget.hashCode^
      primaryColor.hashCode;
}
