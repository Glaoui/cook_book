//

import 'package:http/http.dart' as http;
import 'package:flutter_auth/models/Labels.dart';

class Services {
  //
  static const String url = "http://192.168.1.18:3012/recipes/labels";

  static Future<List<Labels>> getLabels() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Labels> labels = labelsFromJson(response.body);
        return labels;
      } else {
        return List<Labels>();
      }
    } catch (e) {
      return List<Labels>();
    }
  }
}
