import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login page'),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '$emailController.text -- $passwordController.text')));
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
    );
  }
}
