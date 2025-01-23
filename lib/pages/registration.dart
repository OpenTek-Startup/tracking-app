import 'package:flutter/material.dart';
import 'package:learningflutterappwrite/type/signupCallback.dart';
import 'package:learningflutterappwrite/widgets/signupForm.dart';

class Registration extends StatefulWidget {
  static const String name = 'registration';
  final signupCallback onsignUp;
  const Registration({super.key, required this.onsignUp});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Signupform(
            emailController: _emailController, 
            nameController: _nameController, 
            passwordController: _passwordController, 
            confPasswordController: _confirmedPasswordController, 
            onPressedLogin: widget.onsignUp)
        ],
      ),
    );
  }
}
