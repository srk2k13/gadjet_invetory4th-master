import 'package:flutter/material.dart';
import 'package:gadjet_invetory/Screens/Category/categories_page.dart';
import 'package:gadjet_invetory/Services/auth.dart';


import 'auth_page.dart';


class CheckUserAuth extends StatefulWidget {
  @override
  _CheckUserAuthState createState() => _CheckUserAuthState();
}

class _CheckUserAuthState extends State<CheckUserAuth> {
  @override
  Widget build(BuildContext context) {
    if (AuthService().getCurrentUser() != null){
      return MainCategories();
    }else{
      return AuthPage();
    }
  }
}
