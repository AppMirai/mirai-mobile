import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mirai_app/model/products.dart';

class ApiService {
  static const String _baseUrl = "https://app-mirai.herokuapp.com/api/";

  Future<Products> getProduct() async {
    final response = await http.get(Uri.parse(_baseUrl + "products"));

    if (response.statusCode == 200) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get product');
    }
  }
}
