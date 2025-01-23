import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/pages/HomePage.dart';
import 'package:learningflutterappwrite/pages/LoginPage.dart';
import 'package:learningflutterappwrite/pages/registration.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
        name: Homepage.name, path: '/', builder: (_, __) => const Homepage()),
    GoRoute(
        name: Registration.name,
        path: '/registration',
        builder: (context, state) {
          return Registration(
            onsignUp: (name, email, password) async {
              print('$name -- $email -- $password');
            },
          );
        }),
    GoRoute(
        path: '/login',
        name: Loginpage.name,
        builder: (_, __) => Loginpage(
              loginfunc: (email, password) {
                print(Text('$email -- $password'));
              },
            ))
  ]);
});
