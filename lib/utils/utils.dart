// import 'package:fluttertoast/fluttertoast.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
 // static toastMessage(String message) {
 //   Fluttertoast.showToast(
 //       msg: message,
 //       toastLength: Toast.LENGTH_SHORT,
 //       gravity: ToastGravity.CENTER,
 //       timeInSecForIosWeb: 1,
 //       fontSize: 16.0
 //   );
 // }

  static void fieldFocusChange
      (BuildContext context,  FocusNode currentFocus, FocusNode nextFocus)
  {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(10),
          duration: Duration(seconds: 3),
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          positionOffset: 20,
          icon: Icon(Icons.error, size: 28, color: Colors.white,),
          message: message,
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(message))
    );
  }
}