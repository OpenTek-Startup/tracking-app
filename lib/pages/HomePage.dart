import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/pages/registration.dart';

class Homepage extends StatelessWidget {
  static const String name = 'home';
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text('Home')),
      ),
      body: Column(children: [
        Center(
          child: Column(children: [
            Text('WELCOME TO HOME PAGE'),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Registration.name);
                },
                child: Text('Go to registration page'))
          ]),
        ),
      ]),
    );
  }
}
