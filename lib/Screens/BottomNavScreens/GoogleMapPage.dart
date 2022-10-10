import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:spot_buy/Models/GoogleMapMarkerModel.dart';
import 'package:spot_buy/Screens/BottomNavScreens/DirectionScreen.dart';
import 'package:spot_buy/Utils/SpotColors.dart';

// ignore: must_be_immutable
class GoogleMapPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  Set<GoogleMapMarkerModel> googleMapMarkers;

  GoogleMapPage({Key? key, required this.googleMapMarkers}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<GoogleMapPage> createState() => _GoogleMapPageState(googleMapMarkers);
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  _GoogleMapPageState(this.googleMapMarkers);

  GoogleMapController? mapController; //contrller for Google map
  LatLng showLocation = const LatLng(24.527579, 81.109152);

  Set<Marker> markers = {}; // Google map markers

  Set<GoogleMapMarkerModel> googleMapMarkers;// Google map locations




  Location currentLocation = Location();//Current Location
  late LatLng currentLatLang ;

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return GoogleMap(
      zoomGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: showLocation,
        zoom: 18.0,
      ),
      markers: markers,
      myLocationButtonEnabled: true,
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      onMapCreated: (controller) {
        //method called when map is created
        setState(() {
          mapController = controller;
        });
      },
    );
  }

  @override
  void initState() {

    if (googleMapMarkers.isEmpty) {
      getCurrentLocation();

    } else {
      markers.clear();
      for (GoogleMapMarkerModel marker in googleMapMarkers) {

        GoogleMapMarkerModel temp=marker;
        markers.add(Marker(
          //add marker on google map
            markerId: MarkerId(marker.id.toString()),
            position: marker.position,
            //position of marker
            infoWindow: InfoWindow(
              //popup info
              title: marker.title,
              snippet: marker.subTitle,
            ),
            icon:  BitmapDescriptor.defaultMarker ,
            //Icon for Marker
            onTap: () {
              ShowDetails(context, temp);
            }));
      }
    }
    super.initState();
  }

  void getCurrentLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      currentLatLang =LatLng(loc.latitude ?? 00, loc.longitude ?? 00);
      mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 18.0,
      )));

      currentLocation.changeSettings(accuracy: LocationAccuracy.high);

      try{
        setState(() {
          markers.clear();
          markers.add(Marker(
              markerId: MarkerId('Current'),
              position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
        });
      }
      on Exception{

        print(Error);
      }

    });
  }

  // ignore: non_constant_identifier_names
  static ShowDetails(context, GoogleMapMarkerModel marker) {
    showModalBottomSheet<dynamic>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        elevation: 8,
        isScrollControlled: false,
        useRootNavigator: true,
        builder: (BuildContext context){
          return DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder: (BuildContext context, ScrollController scrollController){

            return Column(
              children: [
               // ListView(),
                const SizedBox(height: 16,),
                Text(
                  "Title :" + marker.title,
                  style: const TextStyle(
                      fontSize: 24, color: SpotColors.colorPrimary),
                ),
                const SizedBox(height: 16,),
                Text(
                  "Sub Title :" + marker.subTitle,
                  style: const TextStyle(
                      fontSize: 22, color: SpotColors.colorPrimary),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Respond to button press
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        //TODO
                        return  DirectionScreen(destinationLocation: marker.position);
                      })
                    ,
                      (route) => true);
                  },
                  icon: const Icon(Icons.directions, size: 26),
                  label: const Text("Direction"),

                )
              ],
            );
          });
        }
    );
  }


  }

