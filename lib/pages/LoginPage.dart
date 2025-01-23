import 'package:flutter/material.dart';
import 'package:learningflutterappwrite/type/loginCallback.dart';
import 'package:learningflutterappwrite/widgets/loginForm.dart';

class Loginpage extends StatefulWidget {
  static const String name = "login";

  loginCallback loginfunc;
  Loginpage({super.key, required this.loginfunc});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Loginform(
              emailController: _emailController,
              passwordController: _passwordController,
              onPressLoginbtn: widget.loginfunc)
        ],
      ),
    );
  }
}
