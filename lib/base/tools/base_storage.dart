import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class BaseStorage {
  BaseStorage();
  static late BaseStorage instance;

  //----------------------
  late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    instance = this;
  }

  Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    return sharedPreferences.setString(key, value);
  }

  String loadString({
    required String key,
    String defaultValue = "",
  }) {
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  Future<bool> saveListString({
    required String key,
    required List<String> value,
  }) async {
    return sharedPreferences.setStringList(key, value);
  }

  List<String> loadListString({
    required String key,
    List<String>? defaultValue,
  }) {
    return sharedPreferences.getStringList(key) ?? defaultValue ?? [];
  }

  Future<bool> saveJson({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    return sharedPreferences.setString(key, jsonEncode(value));
  }

  Map<String, dynamic> loadJson({
    required String key,
    Map<String, dynamic> defaultValue = const {},
  }) {
    return jsonDecode(sharedPreferences.getString(key) ?? "{}") ?? defaultValue;
  }
}
