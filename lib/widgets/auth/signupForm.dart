import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/pages/LoginPage.dart';
import 'package:learningflutterappwrite/type/signupCallback.dart';

class Signupform extends StatelessWidget {
  final signupCallback onPressedLogin;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confPasswordController;
  const Signupform(
      {super.key,
      required this.emailController,
      required this.nameController,
      required this.passwordController,
      required this.confPasswordController,
      required this.onPressedLogin});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity, // Prendre toute la largeur
            height: MediaQuery.of(context).size.height * 1 / 4,
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
            height: MediaQuery.of(context).size.height * 3 / 4,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Bienvenu!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Créez votre compte de vie spirituelle.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent),
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text('Entrer le nom'),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(label: Text('Email')),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Entrez le mot de passe'),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    obscureText: true,
                    controller: confPasswordController,
                    decoration: InputDecoration(
                        label: Text('Confirmez le mot de passe')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (passwordController.text !=
                            confPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Mots de passe ne correspondent pas')));
                        } else {
                          return onPressedLogin(nameController.text,
                              emailController.text, passwordController.text);
                        }
                        emailController.clear();
                        passwordController.clear();
                        nameController.clear();
                      },
                      child: const Text('       Création     ')),
                  Column(
                    children: [
                      Text('Vous avez deja un compte?'),
                      TextButton(
                          onPressed: () => {context.goNamed(Loginpage.name)},
                          child: Text('Connectez vous')),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
