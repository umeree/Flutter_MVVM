

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarc/model/user_model.dart';
import 'package:mvvmarc/repositories/auth_repository.dart';
import 'package:mvvmarc/utils/routes/routes_name.dart';
import 'package:mvvmarc/utils/utils.dart';
import 'package:mvvmarc/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi (dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginAPi(data).then((value) {

      setLoading(false);
      final userPrefrence = Provider.of<UserViewModel>(context, listen: false);
      userPrefrence.saveUser(
        UserModel(token: value['token'])
      );
      Utils.flushBarErrorMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {

      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }


  Future<void> signUpApi (dynamic data, BuildContext context) async {

    setLoading(true);
    _myRepo.registerApi(data).then((value) {

      setLoading(false);
      Utils.flushBarErrorMessage("Sign Up Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {

      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }
}