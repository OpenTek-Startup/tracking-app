
import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  static const String name = 'home';
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text('Home')),
      ),

      body: Center(child: Text('WELCOME TO THE HOME PAGE!'),),
    );
  }
}