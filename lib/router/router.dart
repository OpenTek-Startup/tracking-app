import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/appwrite/appwriteConf.dart';
import 'package:learningflutterappwrite/auth_notifier/src/auth_notifier.dart';
import 'package:learningflutterappwrite/auth_notifier/src/auth_state.dart';
import 'package:learningflutterappwrite/pages/HomePage.dart';
import 'package:learningflutterappwrite/pages/LoginPage.dart';
import 'package:learningflutterappwrite/pages/registration.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final AuthNotifier = ref.watch(authProvider.notifier);
  return GoRouter(
    routes: [
      GoRoute(
          name: 'Registration_page',
          path: '/',
          builder: (_, __) => Registration(
                onsignUp: (name, email, password) async {
                  final appwrite = GetIt.instance.get<Appwriteconf>();
                  final user =
                      await appwrite.createAccount(name, email, password);
                  print(jsonEncode(user?.toMap() ?? '{}'));
                },
              )),
      GoRoute(
          name: Registration.name,
          path: '/registration',
          builder: (_, __) => Registration(
                onsignUp: (name, email, password) async {
                  final appwrite = GetIt.instance.get<Appwriteconf>();
                  final user =
                      await appwrite.createAccount(name, email, password);
                  print(jsonEncode(user?.toMap() ?? '{}'));
                },
              )),
      GoRoute(
          name: Homepage.name,
          path: '/home',
          builder: (context, state) {
            return Homepage();
          }),
      GoRoute(
          path: '/login',
          name: Loginpage.name,
          builder: (_, __) => Loginpage(
                loginfunc: (email, password) async {
                  final appwriteSession = GetIt.instance.get<Appwriteconf>();
                  final session =
                      await appwriteSession.createSession(email, password);
                  debugPrint(jsonEncode(session?.toMap() ?? '{}'));
                  print(Text('session id is: ${session?.$id}'));
                },
              )),
      GoRoute(
          path: '/logout',
          builder: (_, __) => Registration(
                onsignUp: (name, email, password) async {
                  final appwrite = GetIt.instance.get<Appwriteconf>();
                  final user =
                      await appwrite.createAccount(name, email, password);
                  print(user);
                },
              ))
    ],
  );
});
