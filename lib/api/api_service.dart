import 'api.dart';
import 'package:flutter_starter_app/config/app_config.dart';


class APIService {
  late API api;

  static final APIService _instance = APIService._internal();

  factory APIService() {
    return _instance;
  }

  APIService._internal() {
    this.api = API(AppConfig().apiHost );


  }
}