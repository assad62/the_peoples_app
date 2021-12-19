import 'package:sembast/sembast.dart';

import 'app_database.dart';

class AppDatabaseService {
  static final AppDatabaseService _singleton = AppDatabaseService._internal();

  factory AppDatabaseService() {
    return _singleton;
  }

  AppDatabaseService._internal();

  Future<Database> getAppDataBase() {
    return AppDatabase.create();
  }
}