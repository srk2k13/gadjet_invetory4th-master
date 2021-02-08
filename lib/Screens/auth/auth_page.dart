import 'package:flutter/material.dart';
import 'package:gadjet_invetory/Services/auth.dart';


import 'check_user.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  GlobalKey<FormState> _authForm = new GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auth page")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _authForm,
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'password',
                    ),
                  )
                ],
              ),
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: () async {
                    if (_authForm != null) {
                      try {
                        bool authResult = await AuthService().loginUser(
                            email: _email.text, password: _password.text);
                        print(authResult);
                        if (authResult) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CheckUserAuth()));
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                  child: Text("auth"),
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  onPressed: () async{
                    if (_authForm != null) {
                      try{
                        bool regResult = await AuthService().createUser(
                            email: _email.text, password: _password.text);
                        if(regResult){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => CheckUserAuth()));
                        }
                      }catch (error){
                        print(error.toString());
                      }
                    }
                  },
                  child: Text("reg"),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
