import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/services/locations_service/locations_cache_service/locations_cache_service.dart';
import 'package:sembast/sembast.dart';

class LocationsCacheService implements ILocationsCacheService{
  var _store = StoreRef.main();


  @override
  Future<String> getAddressString(double lat, double long) async {
    var db = await AppDatabaseService().getAppDataBase();
    try{
      return await _store.record("$lat$long").get(db);
    }
    catch(e){
      return '';
    }
  }

  @override
  Future<void> saveAddressString(double lat, double long,String address) async{
    var db = await AppDatabaseService().getAppDataBase();

    await _store.record("$lat$long").put(db, address);

  }
  
}