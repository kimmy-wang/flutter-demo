import 'package:flutter/material.dart';

import 'package:flutter_demo/common/utils/navigator_util.dart';
import 'package:flutter_demo/ui/pages/samples/contacts.dart';

List<Map<String, Object>> samples = [
  {
    "title": "相册示例",
    "description": "相册示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "扫码示例",
    "description": "扫码示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "生物认证示例",
    "description": "生物认证示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "近场通信示例",
    "description": "近场通信示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "视频示例",
    "description": "视频示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "表格示例",
    "description": "表格示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "滑块视图示例",
    "description": "滑块视图示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "顶部Tab页示例",
    "description": "顶部Tab页示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "可编辑顶部Tab页示例",
    "description": "可编辑顶部Tab页示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "通讯录示例",
    "description": "通讯录示例",
    "navigation": (BuildContext context, String title) =>
        NavigatorUtil.push(context, Contacts(headerTitle: title,)),
  },
  {
    "title": "通知推送示例",
    "description": "通知推送示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "分享示例",
    "description": "分享示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "动画示例",
    "description": "动画示例",
    "navigation": (BuildContext context, String title) => {},
  },
  {
    "title": "地图示例",
    "description": "地图示例",
    "navigation": (BuildContext context, String title) => {},
  },
];