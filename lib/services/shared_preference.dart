import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:week7/models/user_model.dart';

class SharedPrefs {
  Future<void> saveData(UserModel user) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final convertedValue = jsonEncode(user.toJson());

    inspect(convertedValue);
    shared.setString('userInfo', convertedValue);
  }

  Future<UserModel> getData() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final userData = shared.getString('userInfo');
    final response = UserModel.fromJson(jsonDecode(userData!));
    return response;
  }
}
