import 'package:amire_sokhan/Screens/allsokhan_screen.dart';
import 'package:amire_sokhan/Screens/bookmark_screen.dart';
import 'package:amire_sokhan/Screens/components/search_result_com.dart';
import 'package:amire_sokhan/Screens/search_screen.dart';
import 'package:amire_sokhan/database/db_helper.dart';
import 'package:amire_sokhan/database/sokhan_model.dart';
import 'package:amire_sokhan/state_widget/state_model.dart';
import 'package:flutter/material.dart';

class MainStateful extends StatefulWidget {
  const MainStateful({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  _MainStatefulState createState() => _MainStatefulState();
}

class _MainStatefulState extends State<MainStateful> {
  StateWidget state = StateWidget();

  List<Sokhan> _res = [];
  void fetchData() async {
    await DbHelper.dbHelper.getAllFavSokhan().then((value) => _res = value);

    StateWidget newState = state.copy(allData: _res);
    setState(() {
      state = newState;
    });
  }

  @override
  void initState() {
    fetchData();
    DbHelper.dbHelper.searchInAllSokhan("متن").then((value) => print(value));
  }

  void navigatePageFromBottomBar(int value) {
    List<Widget> _wList = [
      const BookmarkScreen(),
      const AllSokhanScreen(),
      const SearchScreen()
    ];
    final newState = state.copy(index: value, bodyWidget: _wList[value]);
    setState(() {
      state = newState;
    });
  }

  void searchQuery(String text) {
    if (text.isNotEmpty) {
      StateWidget newState =
          state.copy(searchResultCom: SearchResultCom(query: text));
      setState(() {
        state = newState;
      });
    } else {
      StateWidget newState = state.copy(searchResultCom: Container());
      setState(() {
        state = newState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritWidget(state, this, child: widget.child);
  }
}

class StateInheritWidget extends InheritedWidget {
  StateInheritWidget(this.state, this.mainStatefulState,
      {Key? key, required this.child})
      : super(key: key, child: child);

  final Widget child;
  final StateWidget state;
  final _MainStatefulState mainStatefulState;

  static _MainStatefulState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StateInheritWidget>()!
        .mainStatefulState;
  }

  @override
  bool updateShouldNotify(StateInheritWidget oldWidget) {
    return oldWidget.state != state;
  }
}
