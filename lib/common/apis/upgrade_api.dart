import 'package:dio/dio.dart';

import 'package:flutter_demo/common/http/http.dart';
import 'package:flutter_demo/common/model/upgrade_model.dart';

var http = Http();
class UpgradeAPi {
  static Future<UpgradeModel> fetch() async {
    var url = 'upgrade.json';

    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        var result = response.data;
        if (result != null) {
          return UpgradeModel.fromJson(result);
        }
      }
    } on DioError catch (e) {
      formatError(e);
    }

    return null;
  }
}
