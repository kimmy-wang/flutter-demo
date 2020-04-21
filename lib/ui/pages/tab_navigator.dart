import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/common/utils/dark_mode_util.dart';
import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/common/mock/bottom_tabs.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _pages() {
    List<Widget> pages = [];
    tabs.forEach(
        (ele) => {pages.add((ele["widget"] as Function)(ele["title"]))});
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: _pages(),
      ),
      bottomNavigationBar: Opacity(
        opacity: 1.0,
        child: BottomNavigationBar(
          selectedFontSize: 12,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: _items(_theme),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _items(ThemeData theme) {
    List<BottomNavigationBarItem> items = [];
    tabs.asMap().forEach((index, item) {
      items.add(_item(theme, index, item));
    });
    return items;
  }

  BottomNavigationBarItem _item(ThemeData theme, int index,
          Map<String, Object> item) =>
      BottomNavigationBarItem(
        title: StoreConnector<AppState, ThemeMode>(
          converter: (store) => store.state.darkMode,
          builder: (context, darkMode) => Text(
            item["title"],
            style: TextStyle(
              color: _currentIndex == index
                  ? theme.accentColor
                  : DarkModeUtil.isDarkMode(context, darkMode)
                      ? Colors.white38
                      : Colors.black38,
            ),
          ),
        ),
        icon: StoreConnector<AppState, ThemeMode>(
          converter: (store) => store.state.darkMode,
          builder: (context, darkMode) => Icon(
            item["icon"],
            color: DarkModeUtil.isDarkMode(context, darkMode)
                ? Colors.white38
                : Colors.black38,
          ),
        ),
        activeIcon: Icon(
          item["icon"],
          color: theme.accentColor,
        ),
      );
}
