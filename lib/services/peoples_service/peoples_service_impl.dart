import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_starter_app/api/api_service.dart';
import 'package:flutter_starter_app/api/endpoints.dart';
import 'package:flutter_starter_app/model/peoples_list_model.dart';
import 'package:flutter_starter_app/model/peoples_model.dart';
import 'package:flutter_starter_app/services/locations_service/locations_service_impl.dart';
import 'package:flutter_starter_app/services/peoples_service/api_call/peoples_api_service_impl.dart';
import 'package:flutter_starter_app/services/peoples_service/peoples_service.dart';
import 'package:rxdart/rxdart.dart';



class PeoplesService implements IPeoplesService {

  var _apiService = PeoplesApiService();
  var _locationService  = LocationsService();
  

  @override
  Future<List<PeoplesListModel>> getPeoplesList() {

    try{
      var getListOfPeople = Stream.fromFuture(_apiService.getListOfPeoplesResponse())
          .switchMap((element) {
        return Stream.fromIterable(element);
      }).map((event) {
        return Map<String,dynamic>.from(event);
      }).map((event) {
        return PeoplesModel.fromJson(event);
      }).asyncMap((event) async{
        String address = await _getAddressString(event.location?.latitude ?? 0.0, event.location?.longitude ?? 0.0 );
        return PeoplesListModel(address: address, model: event);
      }).toList();

      return getListOfPeople;
    }
    catch(e){

      return Future.value([]);
    }








  }


  Future<String> _getAddressString(double lat, double long) async{
   return await  _locationService.getAddress(lat, long);
  }
}
