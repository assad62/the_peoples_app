import 'dart:convert';

import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/services/peoples_service/api_cache/peoples_api_cache.dart';
import 'package:sembast/sembast.dart';

class PeoplesApiCache extends IPeoplesApiCache{
  var _store = StoreRef.main();


  @override
  Future<String> getCacheResponse()  async{
    var db = await AppDatabaseService().getAppDataBase();
    try {
      return await _store.record('PeoplesData').get(db);
    }
    catch(e){
      return "";
    }

  }

  @override
  Future<void> storeCacheResponse(res) async{

     var db = await AppDatabaseService().getAppDataBase();
     await _store.record("PeoplesData").put(db, json.encode(res.data));
  }

}