import 'package:flutter/material.dart';

import 'auth/check_user.dart';


class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return CheckUserAuth();
  }
}
