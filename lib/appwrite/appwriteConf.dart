import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:learningflutterappwrite/env.dart';

class Appwriteconf {
  Client client = Client();
  late final Account account;

  Appwriteconf() {
    EnvironmentVar env = EnvironmentVar();
    client.setEndpoint(env.endpoint).setProject(env.databaseId);
    account = Account(client);
  }

  Future<User?> createAccount(
      String name, String email, String password) async {
    try {
      final user = await account.create(
          userId: 'unique()', email: email, password: password);
      return user;
    } on AppwriteException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<User?> getAccount() async {
    final user = await account.get();
    return user;
  }

  Future<Session?> createSession(String email, String password) async {
    try {
      final session = await account.createEmailPasswordSession(
          email: email, password: password);
      return session;
    } on AppwriteException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<void> logout() async {
    await account.deleteSession(sessionId: 'current');
  }
}
