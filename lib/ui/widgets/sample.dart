import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/common/model/app_state.dart';

class Sample extends StatelessWidget {
  final String title;
  final String description;
  final Function navigation;

  const Sample({Key key, this.title, this.description, this.navigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<ThemeModel>(context);
    return GestureDetector(
      onTap: () => {
        if (navigation != null) {navigation(context, title)}
      },
      child: StoreConnector<AppState, bool>(
        converter: (store) => store.state.darkMode,
        builder: (context, darkMode) => Container(
          height: 62,
          padding: EdgeInsets.only(top: 6, bottom: 6),
          decoration:
              BoxDecoration(color: darkMode ? Colors.black87 : Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 6, bottom: 4),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: darkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 6,
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: darkMode ? Colors.white30 : Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
