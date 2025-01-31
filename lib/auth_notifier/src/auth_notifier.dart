import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:learningflutterappwrite/appwrite/appwriteConf.dart';
import 'auth_state.dart';
import 'user.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(status: AuthStatus.loading)) {
    authenticate();
  }

  final authProvider = GetIt.I.get<Appwriteconf>();

  authenticate() async {
    try {
      final user = await authProvider.getAccount();
      state = state.copyWith(
          user: User.fromMap(user!.toMap()),
          error: null,
          status: AuthStatus.authenticated);
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, status: AuthStatus.unauthenticated, user: null);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), user: null, status: AuthStatus.unauthenticated);
    }
  }

  logout() async {
    try {
      authProvider.logout();
      state = state.copyWith(
          user: null, error: null, status: AuthStatus.unauthenticated);
    } on AppwriteException catch (e) {
      state = state.copyWith(error: e.message);
      print(e);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  login(String email, String password) async {
    try {
      await authProvider.createSession(email, password);
      authenticate();
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
      print(e);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), user: null, status: AuthStatus.unauthenticated);
    }
  }

  signup(String email, String name, String password) async {
    try {
      state = state.copyWith(
        error: null,
        status: AuthStatus.loading,
        user: null,
      );
      await authProvider.createAccount(name, email, password);
      login(email, password);
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
      print(e);
    }
  }
}
