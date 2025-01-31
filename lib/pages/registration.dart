import 'package:flutter/material.dart';
import 'package:learningflutterappwrite/type/signupCallback.dart';
import 'package:learningflutterappwrite/widgets/auth/signupForm.dart';

class Registration extends StatefulWidget {
  static const String name = 'registration';
  final signupCallback onsignUp;
  const Registration({super.key, required this.onsignUp});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
