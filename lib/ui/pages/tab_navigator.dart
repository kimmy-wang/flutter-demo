import 'package:flutter/material.dart';

import 'package:flutter_demo/ui/pages/samples/samples_page.dart';
import 'package:flutter_demo/ui/pages/category/category_page.dart';
import 'package:flutter_demo/ui/pages/webview/webview_page.dart';
import 'package:flutter_demo/ui/pages/settings/settings_page.dart';
import 'package:flutter_demo/ui/store/state.dart';
import 'package:flutter_redux/flutter_redux.dart';

List<Map<String, Object>> tabs = [
  {
    "title": "示例",
    "icon": Icons.grid_on,
    "widget": (title) =>
        SamplesPage(
          headerTitle: title,
        )
  },
  {
    "title": "分类",
    "icon": Icons.format_list_numbered_rtl,
    "widget": (title) =>
        CategoryPage(
          headerTitle: title,
        )
  },
  {
    "title": "网页",
    "icon": Icons.open_in_browser,
    "widget": (title) =>
        WebviewPage(
          headerTitle: title,
        )
  },
  {
    "title": "设置",
    "icon": Icons.settings,
    "widget": (title) =>
        SettingsPage(
          headerTitle: title,
        )
  }
];

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
        title: StoreConnector<FlutterDemoState, bool>(
          converter: (store) => store.state.darkMode,
          builder: (context, darkMode) =>
              Text(
                item["title"],
                style: TextStyle(
                  color:
                  _currentIndex == index ? theme.accentColor : (darkMode
                      ? Colors
                      .white38
                      : Colors.black38),
                ),
              ),
        ),
        icon: StoreConnector<FlutterDemoState, bool>(
          converter: (store) => store.state.darkMode,
          builder: (context, darkMode) =>
              Icon(
                item["icon"],
                color: darkMode ? Colors.white38 : Colors.black38,
              ),
        ),
        activeIcon: Icon(
          item["icon"],
          color: theme.accentColor,
        ),);
}
