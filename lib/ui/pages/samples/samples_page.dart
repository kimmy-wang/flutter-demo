import 'package:flutter/material.dart';

import 'package:flutter_demo/ui/widgets/sample.dart';
import 'package:flutter_demo/ui/widgets/option_dialog.dart';
import 'package:flutter_demo/common/utils/navigator_util.dart';

List<Map<String, Object>> samples = [
  {
    "title": "相册示例",
    "description": "相册示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "扫码示例",
    "description": "扫码示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "生物认证示例",
    "description": "生物认证示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "近场通信示例",
    "description": "近场通信示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "视频示例",
    "description": "视频示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "表格示例",
    "description": "表格示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "滑块视图示例",
    "description": "滑块视图示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "顶部Tab页示例",
    "description": "顶部Tab页示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "可编辑顶部Tab页示例",
    "description": "可编辑顶部Tab页示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "通讯录示例",
    "description": "通讯录示例",
    "navigation": (BuildContext context) =>
        NavigatorUtil.push(context, OptionDialog()),
  },
  {
    "title": "通知推送示例",
    "description": "通知推送示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "分享示例",
    "description": "分享示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "动画示例",
    "description": "动画示例",
    "navigation": (BuildContext context) => {},
  },
  {
    "title": "地图示例",
    "description": "地图示例",
    "navigation": (BuildContext context) => {},
  },
];

class SamplesPage extends StatefulWidget {
  final String headerTitle;

  const SamplesPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _SamplesPageState createState() => _SamplesPageState();
}

class _SamplesPageState extends State<SamplesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Samples"),
      ),
      body: Container(
        margin: EdgeInsets.all(6),
        child: ListView.separated(
          itemCount: samples.length,
          itemBuilder: (context, index) => Sample(
            title: samples[index]["title"],
            description: samples[index]["description"],
            navigation: (samples[index]["navigation"] as Function),
          ),
          separatorBuilder: (context, index) => Divider(
            height: 4,
          ),
        ),
      ),
    );
  }
}
