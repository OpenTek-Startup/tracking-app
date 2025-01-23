import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learningflutterappwrite/pages/HomePage.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [GoRoute(name: Homepage.name, path: '/', builder: (_, __) => const Homepage())]);
});
