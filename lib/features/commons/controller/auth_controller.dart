import 'dart:convert';
import 'package:ecommerce_app/features/commons/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String _userDatakey = 'user-data';
  final String _tokenkey = 'access-token';
  UserModel? userModel;
  String? accessToken;
  Future<void> saveUserData(String token, UserModel model) async {
    final SharedPreferences sharedPreferecnes =
        await SharedPreferences.getInstance();

    await sharedPreferecnes.setString(_userDatakey, jsonEncode(model.toJson()));
    await sharedPreferecnes.setString('access-token', token);
    print(token);
    print(model);

    // Verify by reading it right back
    final testToken = sharedPreferecnes.getString(_tokenkey);

    userModel = model;
    accessToken = token;
  }

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString(_userDatakey);
    String? tokenData = sharedPreferences.getString(_tokenkey);

    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
      accessToken = tokenData;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? tokenData = sharedPreferences.getString(_tokenkey);

    if (tokenData != null) {
      await getUserData();
      return true;
    }
    print(tokenData);

    // Verify immediately after save

    return false;
  }

  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    userModel = null;
  }
}
