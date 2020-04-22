import 'package:flutter_demo/ui/pages/samples/samples_page.dart';
import 'package:flutter_demo/ui/pages/category/category_page.dart';
import 'package:flutter_demo/ui/pages/webview/webview_page.dart';
import 'package:flutter_demo/ui/pages/settings/settings_page.dart';

const String samplesTitle = '示例';
const String categoriesTitle = '分类';
const String webViewTitle = '网页';
const String settingsTitle = '设置';

const List<Map<String, dynamic>> tabs = [
  {
    "title": samplesTitle,
    "icon": 0xe3ec,
  },
  {
    "title": categoriesTitle,
    "icon": 0xe267,
  },
  {
    "title": webViewTitle,
    "icon": 0xe89d,
  },
  {
    "title": settingsTitle,
    "icon": 0xe8b8,
  }
];

List<Map<String, Object>> tabsWithWidget = [
  {
    "title": samplesTitle,
    "widget": (title) => SamplesPage(
          headerTitle: title,
        )
  },
  {
    "title": categoriesTitle,
    "widget": (title) => CategoryPage(
          headerTitle: title,
        )
  },
  {
    "title": webViewTitle,
    "widget": (title) => WebViewPage(
          headerTitle: title,
        )
  },
  {
    "title": settingsTitle,
    "widget": (title) => SettingsPage(
          headerTitle: title,
        )
  }
];
