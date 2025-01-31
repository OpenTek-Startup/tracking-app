import 'package:flutter/material.dart';
import 'package:learningflutterappwrite/type/loginCallback.dart';
import 'package:learningflutterappwrite/widgets/auth/loginForm.dart';

class Loginpage extends StatefulWidget {
  static const String name = "login";

  loginCallback loginfunc;
  Loginpage({super.key, required this.loginfunc});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
