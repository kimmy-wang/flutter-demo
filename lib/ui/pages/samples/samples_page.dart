import 'package:flutter/material.dart';

import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_demo/common/apis/upgrade_api.dart';
import 'package:flutter_demo/common/mock/samples.dart';
import 'package:flutter_demo/common/model/upgrade_model.dart';
import 'package:flutter_demo/ui/widgets/samples_item.dart';

class SamplesPage extends StatefulWidget {
  final String headerTitle;

  const SamplesPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _SamplesPageState createState() => _SamplesPageState();
}

class _SamplesPageState extends State<SamplesPage> {
  UpgradeModel _upgrade;

  @override
  void initState() {
    _initUpgradeDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> filteredSamples =
        samples.where((item) => !(item['hidden'] ?? false)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Samples"),
      ),
      body: Container(
        margin: EdgeInsets.all(6),
        child: ListView.separated(
          itemCount: filteredSamples.length,
          itemBuilder: (context, index) => SamplesItem(
            title: filteredSamples[index]["title"],
            description: filteredSamples[index]["description"],
            navigation: (filteredSamples[index]["navigation"] as Function),
          ),
          separatorBuilder: (context, index) => Container(
            height: 10,
          ),
        ),
      ),
    );
  }

  void _initUpgradeDialog() async {
    UpgradeAPi.fetch().then((UpgradeModel value) async {
      if (value != null) {
        setState(() {
          _upgrade = value;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String key = '${value.version}.${value.build}';
        if (value.testflight && prefs.getString(key) == null) {
          showDialog(
            context: context,
            builder: (_) => NetworkGiffyDialog(
              image: Image.network(value.url),
              title: Text(value.title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
              description: Text(
                value.description ?? '',
                textAlign: TextAlign.center,
              ),
              entryAnimation: EntryAnimation.DEFAULT,
              onOkButtonPressed: () async {
                if (await canLaunch('itms-beta://')) {
                  await prefs.setString(key, '${new DateTime.now().millisecondsSinceEpoch}');
                  await launch('https://beta.itunes.apple.com/v1/app/1505145796');
                }
              },
            ),
          );
        }
      }
    }).catchError((error) {
      print(error);
    });
  }
}
