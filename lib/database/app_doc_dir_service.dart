import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AppDocDirService{
  static final AppDocDirService _singleton = AppDocDirService._internal();

  factory AppDocDirService() {
    return _singleton;
  }

  AppDocDirService._internal();

  Future<Directory> getAppDocDirectory() async{

    return await getApplicationDocumentsDirectory();

  }

}