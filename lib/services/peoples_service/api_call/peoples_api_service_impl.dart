import 'dart:convert';

import 'package:flutter_starter_app/api/api_service.dart';
import 'package:flutter_starter_app/api/endpoints.dart';
import 'package:flutter_starter_app/services/peoples_service/api_cache/peoples_api_cache_impl.dart';
import 'package:flutter_starter_app/services/peoples_service/api_call/peoples_api_service.dart';


class PeoplesApiService extends IPeoplesApiService{
  var _apiService = APIService();
  var _apiCacheService = PeoplesApiCache();
 //

  Future<dynamic> _apiCall() async{
    Uri uri = _apiService.api.endpointUri(Endpoint.listPeople);
    try{
       var res = await _apiService.api.dio.get(uri.toString());
       await _apiCacheService.storeCacheResponse(res);
       return res.data;
    }
    catch(e){
      return [];
    }



  }

  Future<dynamic> _apiCache() async{

    try{
     var cachedResponse = await _apiCacheService.getCacheResponse();
     return json.decode(cachedResponse);
    }
    catch(e){
      return [];
    }



  }





  @override
  Future<dynamic> getListOfPeoplesResponse() async {

     var res = await _apiCall();

     if(res.length == 0){

       //something went wrong with the api
       return _apiCache();

     }


     return _apiCall();
  }

}
