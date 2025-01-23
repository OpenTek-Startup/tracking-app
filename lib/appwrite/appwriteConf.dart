import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Appwriteconf {
  Client client = Client();

  Appwriteconf() {
    client.setEndpoint(dotenv.env['endpoint']!).setProject(dotenv.env['databaseId']);
  }
}
