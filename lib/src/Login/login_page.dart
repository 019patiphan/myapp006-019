import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/config/app_setting.dart';
import 'package:miniproject/src/services/networt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(197, 105, 255, 1.0),
          Color.fromRGBO(255, 169, 252, 1.0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: topPadding),
              SizedBox(height: 50),
              Image.asset('assets/images/logog.png',
              width: 200,
              height: 200,),
              Container(
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 50,
                        fontFamily: 'Pacifico'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(181, 255, 255, 255),
                                blurRadius: 15.0,
                                offset: Offset(0, 10))
                          ]),
                      child: TextField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFFFC32EFE),
                            ),
                            border: InputBorder.none,
                            hintText: "\tUsername",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(181, 255, 255, 255),
                                blurRadius: 15.0,
                                offset: Offset(0, 10))
                          ]),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: isHidden,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Color(0xFFFC32EFE),
                            ),
                            suffixIcon: IconButton(icon: isHidden? Icon(Icons.visibility_off): Icon(Icons.visibility), onPressed: togglePasswordVisibility),
                            border: InputBorder.none,
                            hintText: "\tPassword",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    //SizedBox(height: 5,),
                  ],
                ),
              ),
              SizedBox(height: 3),
              ElevatedButton(
                onPressed: () async {
                  final username = _usernameController.text;
                  final password = _passwordController.text;
                  final message = await NetworkService().validateUserLoginDio(username, password);
                  print(message);
                  if (message != 'failed') {
                    print('login success');
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString(AppSetting.userNameSetting, username);
                    prefs.setString(AppSetting.passwordSetting, password);


                    Navigator.pushNamed(context, AppRoute.HomeRoute);
                  }else{
                    print('login failed');
                  //   Flushbar(
                  //     icon: Icon(
                  //       Icons.cancel_outlined,
                  //       color: Colors.red,
                  //     ),
                  //     backgroundColor: Colors.blueGrey,
                  //     title:  "Failed",
                  //     message:  "Login failed, try again!!",
                  //     duration:  Duration(seconds: 5),
                  //   )..show(context);
                   }
                },
                child: Text('Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                    primary: Color(0XFFFC32EFE),
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an Account ?",
                    style: TextStyle(color: Color(0xFFFFAF7FB)),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Text("\t\tSing Up",
                        style: TextStyle(
                            color: Color(0xFFFE3E3E3),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Singup',
              //       style: TextStyle(
              //           color: Colors.black38,
              //           fontSize: 15,
              //           fontWeight: FontWeight.bold)),
              //   style: ElevatedButton.styleFrom(
              //       primary: Color(0XFFF99CCFF),
              //       padding:
              //           EdgeInsets.symmetric(vertical: 10, horizontal: 120),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30))),
              // )
            ],
          ),
        ),
      ),
    );
  }
  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
