import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/model/login_model.dart';
import 'package:mirai_app/model/profile_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> userRegister(Map<String, dynamic> data) async {
    var dataRegister = <String, dynamic>{
      'name': data['name'],
      'email': data['email'],
      'password': data['password'],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "register"),
        body: jsonEncode(dataRegister),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    if (response.statusCode != 201) {
      return false;
    }
    return true;
  }

  Future<UserModel> userLogin(Map<String, dynamic> data) async {
    var dataLogin = <String, String>{
      'email': data['email'],
      'password': data['password'],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "login"),
        body: jsonEncode(dataLogin),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      return UserModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<UserProfileModel> userProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http.get(Uri.parse(baseURLAPI + "user"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response);
    }
  }
}
