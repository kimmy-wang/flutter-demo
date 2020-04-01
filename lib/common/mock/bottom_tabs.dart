import 'package:flutter/material.dart';

import 'package:flutter_demo/ui/pages/samples/samples_page.dart';
import 'package:flutter_demo/ui/pages/category/category_page.dart';
import 'package:flutter_demo/ui/pages/webview/webview_page.dart';
import 'package:flutter_demo/ui/pages/settings/settings_page.dart';

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
        WebViewPage(
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
