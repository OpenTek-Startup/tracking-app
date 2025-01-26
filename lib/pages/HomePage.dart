import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/appwrite/appwriteConf.dart';
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
                onPressed: () async {
                  final authProvider = GetIt.I.get<Appwriteconf>();
                  try {
                    await authProvider.logout(); // Attendre la déconnexion
                    context.go('/registration'); // Redirection
                  } catch (e) {
                    // Gérer l'erreur
                    print('Erreur lors de la déconnexion: $e');
                  }
                },
                child: Text('Logout'))
          ]),
        ),
      ]),
    );
  }
}
