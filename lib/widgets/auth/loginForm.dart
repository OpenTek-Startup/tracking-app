import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/pages/HomePage.dart';
import 'package:learningflutterappwrite/pages/registration.dart';
import 'package:learningflutterappwrite/type/loginCallback.dart';

class Loginform extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loginCallback onPressLoginbtn;
  Loginform({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressLoginbtn,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity, // Prendre toute la largeur
            height: MediaQuery.of(context).size.height * 1 / 3,
            child: Image.asset('assets/gifs/logo.gif'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white70,
            ),
            width:
                MediaQuery.of(context).size.width, // Prendre toute la largeur
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Text(
                    'Bon retour!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Connectez vous à votre compte',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      label: Text('Mot de passe'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        onPressLoginbtn(
                            emailController.text, passwordController.text);

                        emailController.clear();
                        passwordController.clear();
                        context.goNamed(Homepage.name);
                      },
                      child: Text('Connecter')),
                  Row(
                    children: [
                      Text("Pas encore de compte?"),
                      TextButton(
                          onPressed: () => context.goNamed(Registration.name),
                          child: Text('Créer compte'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
