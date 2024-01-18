


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarc/utils/routes/routes_name.dart';
import 'package:mvvmarc/view/home_screen.dart';
import 'package:mvvmarc/view/login_screen.dart';
import 'package:mvvmarc/view/signup_screen.dart';
import 'package:mvvmarc/view/splash_screen.dart';

class Routes {
   static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
     final args = routeSettings.arguments;
     switch(routeSettings.name) {
       case RoutesName.splash:
         return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
       case RoutesName.home:
         return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
       case RoutesName.login:
         return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
       case RoutesName.signUp:
         return MaterialPageRoute(builder: (BuildContext context) => const SignUpScreen());
       default: 
         return MaterialPageRoute(builder: (_){
           return const Scaffold(
             body: Center(
               child: Text("No route is defined"),
             ),
           );
         });
     }
   }
}