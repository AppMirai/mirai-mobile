import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mirai_app/model/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/strings.dart';

class CategoryService {
  Future<CategoryModel> getCategory() async {
    final response = await http.get(Uri.parse(baseURLAPI + "/categories"));

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get Category');
    }
  }
}
