import 'package:flutter/material.dart';
import 'package:flutter_demo/common/mock/bottom_tabs.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/common/utils/dark_mode_util.dart';
import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/ui/pages/category/category_page.dart';
import 'package:flutter_demo/ui/pages/samples/samples_page.dart';
import 'package:flutter_demo/ui/pages/settings/settings_page.dart';
import 'package:flutter_demo/ui/pages/webview/webview_page.dart';

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

  List<Widget> _pages(List<Map<String, dynamic>> bottomTabs) {
    List<Widget> pages = [];
//    bottomTabs.forEach(
//        (ele) => {pages.add((ele["widget"] as Function)(ele["title"]))});
    bottomTabs.forEach((Map<String, dynamic> item) {
      Map<String, dynamic> element = tabsWithWidget
          .firstWhere((Map<String, dynamic> ele) => ele['title'] == item['title']);
      pages.add((element["widget"] as Function)(element["title"]));
    });
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return StoreConnector<AppState, List<Map<String, dynamic>>>(
      converter: (store) => store.state.bottomTabs,
      builder: (context, bottomTabs) {
        return Scaffold(
          body: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: _pages(bottomTabs),
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
              items: _items(_theme, bottomTabs),
            ),
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _items(
      ThemeData theme, List<Map<String, dynamic>> bottomTabs) {
    List<BottomNavigationBarItem> items = [];
    bottomTabs.asMap().forEach((index, item) {
      items.add(_item(theme, index, item));
    });
    return items;
  }

  BottomNavigationBarItem _item(
          ThemeData theme, int index, Map<String, Object> item) =>
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
            IconData(item["icon"], fontFamily: 'MaterialIcons'),
            color: DarkModeUtil.isDarkMode(context, darkMode)
                ? Colors.white38
                : Colors.black38,
          ),
        ),
        activeIcon: Icon(
          IconData(item["icon"], fontFamily: 'MaterialIcons'),
          color: theme.accentColor,
        ),
      );
}
