import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_view.dart';
import 'package:flutter_starter_app/ui/views/peoples_map_view/peoples_map_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PeoplesMapView extends StatefulWidget{
  @override
  State<PeoplesMapView> createState() => _PeoplesMapViewState();
}


class _PeoplesMapViewState extends State<PeoplesMapView> {


  @override
  Widget build(BuildContext context) {
    return BaseView<PeoplesMapViewModel>(
        onModelReady: (model) => model.onFirstLoad(),
        builder: (context, model, children) =>
    Scaffold(
       body:  Center(
         child: Builder(
           builder: (context) {
             switch (model.loadingStatus) {
               case MapLoadingStatus.Searching:
                 return Text("Loading...");
               case MapLoadingStatus.Completed:
                 return Stack(
                   children: <Widget>[
                     GoogleMap(
                         zoomControlsEnabled: true,
                         zoomGesturesEnabled: true,
                         scrollGesturesEnabled: true,
                         compassEnabled: true,
                         onTap: (position) {

                           //extract to model
                           model.customInfoWindowController
                               .hideInfoWindow!();
                         },
                         onCameraMove: (position) {
                           model
                               .customInfoWindowController.onCameraMove!();
                         },
                         onMapCreated:
                             (GoogleMapController controller) async {
                           model.customInfoWindowController
                               .googleMapController = controller;
                         },
                         markers: model.markersList,
                         initialCameraPosition: model.initialMapPos
                     ),
                     CustomInfoWindow(
                       controller: model.customInfoWindowController,
                       height: 200,
                       width: 300,
                       offset: 50,
                     ),
                   ],
                 );



               case MapLoadingStatus.Empty:
                 return Text("Empty");
             }
           },
         ),
       ))




      );
  }


}