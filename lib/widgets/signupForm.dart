import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text('Registration Form'),
            ),
            SizedBox(height: 5),
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
              decoration:
                  InputDecoration(label: Text('Confirmez le mot de passe')),
            ),
            ElevatedButton(
                onPressed: () {
                  if (passwordController.text != confPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Mots de passe ne correspondent pas')));
                  } else {
                    return onPressedLogin(nameController.text,
                        emailController.text, passwordController.text);
                  }
                },
                child: const Text('Créer'))
          ],
        ),
      ),
    );
  }
}
