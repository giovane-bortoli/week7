import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:week7/models/user_model.dart';

class ClientHttp {
  final dio = Dio();

  Future<List<UserModel>> getUser() async {
    // List<String> list = [];
    // Map<String, int> list1 = {}; Definição de tipos com <>

    try {
      final response = await dio
          .get('https://628e3133368687f3e7121f1a.mockapi.io/api/v1/week7');
      //inspect(response.data);

      return List.from(response.data)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
