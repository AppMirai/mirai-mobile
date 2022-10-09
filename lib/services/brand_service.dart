import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mirai_app/model/brand_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/strings.dart';

class BrandService {
  Future<BrandModel> getBrand() async {
    final response = await http.get(Uri.parse(baseURLAPI + "/brands"));

    if (response.statusCode == 200) {
      return BrandModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get brands');
    }
  }
}
