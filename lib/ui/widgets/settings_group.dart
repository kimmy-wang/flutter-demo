import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/widgets/settings_item.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/common/utils/dark_mode_util.dart';
import 'package:flutter_demo/common/model/app_state.dart';

class SettingsGroup extends StatelessWidget {
  final List<Map<String, Object>> settingsGroup;

  const SettingsGroup({Key key, this.settingsGroup})
      : assert(settingsGroup != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeMode>(
      converter: (store) => store.state.darkMode,
      builder: (context, darkMode) => Container(
        height: 48.0 * settingsGroup.length - 1,
        decoration: BoxDecoration(
            color: DarkModeUtil.isDarkMode(context, darkMode)
                ? Colors.black87
                : Colors.white),
        child: ListView.separated(
          physics: new NeverScrollableScrollPhysics(),
          itemCount: settingsGroup.length,
          itemBuilder: (context, index) => SettingsItem(
            title: settingsGroup[index]["title"],
            navigation: (settingsGroup[index]["navigation"] as Function),
          ),
          separatorBuilder: (context, index) => Container(
            color: Colors.black12,
            height: 1,
          ),
        ),
      ),
    );
  }
}
