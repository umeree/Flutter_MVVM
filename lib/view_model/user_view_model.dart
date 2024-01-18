import 'package:flutter/material.dart';
import 'package:mvvmarc/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModel user) async{
    SharedPreferences sp = await  SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }
  static Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString("token").toString();
    return UserModel(
      token: token,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}