import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/viewstate.dart';
import 'package:flutter_starter_app/model/peoples_location_model.dart';
import 'package:flutter_starter_app/repository/peoples_repo_impl.dart';
import 'package:flutter_starter_app/services/permissions_service/permissions_service_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


enum MapLoadingStatus {
  Completed,
  Searching,
  Empty,
}




class PeoplesMapViewModel extends BaseModel{

  MapLoadingStatus loadingStatus = MapLoadingStatus.Empty;

  var _repo = PeoplesRepo();



  CustomInfoWindowController customInfoWindowController = CustomInfoWindowController();
  CameraPosition initialMapPos = CameraPosition(
      target: LatLng(37.42, -122.08),
      zoom: 15,
  );



  Set<Marker> markersList = Set();
  void onFirstLoad() async{

        var _peoplesLocation = await _repo.getPeoplesLocation();
        buildMap(_peoplesLocation);
  }

  void buildMap(List<PeoplesLocationModel> _peoplesLocation) async {
    loadingStatus = MapLoadingStatus.Searching;
    setState(ViewState.Idle);

    try{

      this.markersList = _peoplesLocation
          .map((peoplesLocation) => Marker(
          markerId: MarkerId(peoplesLocation.sid ?? ""),
          position: LatLng(peoplesLocation.location?.latitude ?? 113.698436,
              peoplesLocation.location?.longitude ?? 113.698436),
          onTap: () {

            customInfoWindowController.addInfoWindow!(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(

                                peoplesLocation.imageAddr ?? "",
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    child: Center(child: Text("Image failed to load", style: TextStyle(fontSize: 8),),),
                                  ); //do something
                                },
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              (peoplesLocation.peoplesName ?? "") ,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              peoplesLocation.address ?? "",
                            ),
                            SizedBox(
                              height: 4,
                            ),


                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
              LatLng(peoplesLocation.location?.latitude ?? 113.698436,
                  peoplesLocation.location?.longitude ?? 113.698436),
            );
          }))
          .toSet();



      if (_peoplesLocation.isEmpty) {
        loadingStatus = MapLoadingStatus.Empty;
      } else {
        initialMapPos = CameraPosition(
            target: LatLng(_peoplesLocation[0].location?.latitude ?? 0.00,
                _peoplesLocation[0].location?.longitude ?? 0.00),
            zoom: 10);
        loadingStatus = MapLoadingStatus.Completed;
      }

      setState(ViewState.Idle);


    }
    catch(e){

      loadingStatus = MapLoadingStatus.Empty;
      setState(ViewState.Idle);
    }



  }

  @override
  void dispose() {
    customInfoWindowController.dispose();
    super.dispose();
  }
}