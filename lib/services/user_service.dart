import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/model/profile_user_model.dart';
import 'package:mirai_app/model/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> userRegister(Map<String, dynamic> data) async {
    var dataRegister = <String, dynamic>{
      'full_name': data['full_name'],
      'email': data['email'],
      'password': data['password'],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "/users/register"),
        body: jsonEncode(dataRegister),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<RegisterDataModel?> userLogin(Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, String>{
        'email': data['email'],
        'password': data['password'],
      };

      var response = await http.post(Uri.parse(baseURLAPI + "/users/login"),
          body: jsonEncode(dataLogin),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterDataModel.fromJson(jsonDecode(response.body)['data']);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<UserProfileModel> userProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response =
        await http.get(Uri.parse(baseURLAPI + "/users/profile"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response);
    }
  }

  Future<UserProfileModel> updateProfile(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var updateUser = <String, String>{
      'full_name': data['full_name'],
    };

    var response = await http.post(
        Uri.parse(baseURLAPI + "/users/update-profile"),
        body: jsonEncode(updateUser),
        headers: {
          'Accept': 'application/json',
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
