import 'package:flutter/material.dart';

import 'package:flutter_demo/common/utils/navigator_util.dart';
import 'package:flutter_demo/ui/pages/settings/about.dart';
import 'package:flutter_demo/ui/pages/settings/top_tab.dart';

List<Map<String, Object>> settings = [
  {
    "title": "底部Tab栏",
    "icon": "",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      TopTab(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "关于",
    "icon": "",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      About(
        headerTitle: title,
      ),
    )
  },
];
