import 'package:flutter/material.dart';
import 'package:learningflutterappwrite/dependencies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningflutterappwrite/router/router.dart';

void main() {
  initDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, router) {
      final router = ref.watch(routerProvider);
      return MaterialApp.router(
        routerConfig: router,
      );
    });
  }
}
