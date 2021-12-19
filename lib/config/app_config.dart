import 'package:flutter_dotenv/flutter_dotenv.dart';
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  late String apiKey;
  late String apiHost;

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal() {

    this.apiHost = "api.json-generator.com";
    this.apiKey = dotenv.env['API_KEY'] ?? "";
  }
}