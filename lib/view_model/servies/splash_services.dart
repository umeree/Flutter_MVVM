import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarc/utils/routes/routes_name.dart';
import 'package:mvvmarc/view_model/user_view_model.dart';
import '../../model/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel.getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async{
      print('Token value is ${value.token}');
      if(value.token == "null" || value.token == ""){
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }
      else {
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}