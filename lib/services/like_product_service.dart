import 'dart:convert';

import '../api/strings.dart';
import 'package:http/http.dart' as http;
import '../model/like_list_model.dart';

class LikeProductService {
  Future<LikeProductModel> getProduct() async {
    final response = await http.get(Uri.parse(baseURLAPI + "/products/likes"));

    if (response.statusCode == 200) {
      return LikeProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get product');
    }
  }
}
