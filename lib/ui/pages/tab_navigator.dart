import 'package:flutter/material.dart';

import 'package:FlutterDemo/ui/pages/samples/samples_page.dart';
import 'package:FlutterDemo/ui/pages/category/category_page.dart';
import 'package:FlutterDemo/ui/pages/webview/webview_page.dart';
import 'package:FlutterDemo/ui/pages/settings/settings_page.dart';

const TEXTS = ['示例', '分类', '网页', '设置'];
const ICONS = [
  Icons.grid_on,
  Icons.format_list_numbered_rtl,
  Icons.open_in_browser,
  Icons.settings,
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

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          SamplesPage(),
          CategoryPage(),
          WebviewPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Opacity(
        opacity: 0.7,
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
    TEXTS.asMap().forEach((int index, String text) {
      items.add(_item(theme, index, text));
    });
    return items;
  }

  BottomNavigationBarItem _item(ThemeData theme, int index, String text) {
    return BottomNavigationBarItem(
        title: Text(
          text,
          style: TextStyle(
            color: _currentIndex == index
                ? theme.accentColor
                : Colors.black38,
          ),
        ),
        icon: Icon(
          ICONS[index],
          color: Colors.black38,
        ),
        activeIcon: Icon(
          ICONS[index],
          color: theme.accentColor,
        ));
  }
}
