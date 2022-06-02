// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:week7/models/complements_model.dart';

class UserModel {
  final String name;
  final int id;
  final int age;
  final ComplementsModel complements;

  UserModel({
    required this.name,
    required this.id,
    required this.age,
    required this.complements,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      id: json['id'],
      age: json['age'],
      complements: ComplementsModel.fromJson(json['complements']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['complements'] = complements.toJson();

    return data;
  }
}
