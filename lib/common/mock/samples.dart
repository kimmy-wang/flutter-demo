import 'package:flutter/material.dart';

import 'package:flutter_demo/common/utils/navigator_util.dart';
import 'package:flutter_demo/ui/pages/samples/animation.dart';
import 'package:flutter_demo/ui/pages/samples/chart.dart';
import 'package:flutter_demo/ui/pages/samples/contacts.dart';
import 'package:flutter_demo/ui/pages/samples/editable_top_tab.dart';
import 'package:flutter_demo/ui/pages/samples/gallery.dart';
import 'package:flutter_demo/ui/pages/samples/local_auth.dart';
import 'package:flutter_demo/ui/pages/samples/map.dart';
import 'package:flutter_demo/ui/pages/samples/nfc.dart';
import 'package:flutter_demo/ui/pages/samples/notification.dart';
import 'package:flutter_demo/ui/pages/samples/share.dart';
import 'package:flutter_demo/ui/pages/samples/swiper.dart';
import 'package:flutter_demo/ui/pages/samples/table.dart';
import 'package:flutter_demo/ui/pages/samples/qr_code.dart';
import 'package:flutter_demo/ui/pages/samples/top_tab.dart';
import 'package:flutter_demo/ui/pages/samples/video.dart';

List<Map<String, Object>> samples = [
  {
    "title": "相册",
    "description": "相册",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      Gallery(
        headerTitle: title,
      ),
    ),
  },
  {
    "title": "扫码",
    "description": "扫码",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      QrCode(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "生物认证",
    "description": "生物认证",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      LocalAuth(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "近场通信",
    "description": "近场通信",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      Nfc(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "视频",
    "description": "视频",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      Video(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "Chart",
    "description": "Chart",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      Chart(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "表格",
    "description": "表格",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      TablePage(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "滑块视图",
    "description": "滑块视图",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      FSwiper(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "顶部Tab页",
    "description": "顶部Tab页",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      TopTab(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "可编辑顶部Tab页",
    "description": "可编辑顶部Tab页",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      EditableTopTab(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "通讯录",
    "description": "通讯录",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
          context,
          Contacts(
            headerTitle: title,
          ),
        )
  },
  {
    "title": "通知推送",
    "description": "通知推送",
    "hidden": true,
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      NotificationPage(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "分享",
    "description": "分享",
    "hidden": true,
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      Share(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "动画",
    "description": "动画",
    "hidden": true,
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      AnimationPage(
        headerTitle: title,
      ),
    )
  },
  {
    "title": "地图",
    "description": "地图",
    "navigation": (BuildContext context, String title) => NavigatorUtil.push(
      context,
      MapPage(
        headerTitle: title,
      ),
    )
  },
];
