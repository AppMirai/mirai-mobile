import 'dart:convert';

import 'package:mirai_app/model/like_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/strings.dart';
import 'package:http/http.dart' as http;

class LikeProductService {
  static Future<bool> checkProductLike(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response =
        await http.post(Uri.parse(baseURLAPI + "/products/like/check"),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': "Bearer $token",
            },
            body: jsonEncode(<String, dynamic>{
              'product_id': id!,
            }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['data']['is_liked'];
    } else {
      throw Exception('Failed to load get product');
    }
  }

  static Future<bool> unlikeProduct(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.post(Uri.parse(baseURLAPI + "/products/unlike"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'product_id': id!,
        }));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load get product');
    }
  }

  static Future<bool> likeProduct(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.post(Uri.parse(baseURLAPI + "/products/like"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, dynamic>{
          'product_id': id!,
        }));

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to load get product');
    }
  }

  static Future<LikeProductModel> listLikeProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.get(
      Uri.parse(baseURLAPI + "/products/likes"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return LikeProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load get product');
    }
  }
}
