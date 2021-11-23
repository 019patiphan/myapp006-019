import 'package:flutter/material.dart';
import 'package:miniproject/src/Home/drawer.dart';
import 'package:miniproject/src/Home/home_page.dart';
import 'package:miniproject/src/Login/login_page.dart';


class AppRoute{
  static const HomeRoute = "Home";
  static const LoginRoute = "Login";
  static const DrawerRoute = 'Drawer';




  final _route = <String, WidgetBuilder>{
    HomeRoute:(context) => HomePage(),
    LoginRoute:(context) => LoginPage(),
    DrawerRoute: (context) => DrawerPage(),

  };

  get getAll => _route;
}//end clas