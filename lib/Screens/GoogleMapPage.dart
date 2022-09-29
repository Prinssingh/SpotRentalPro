import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:spot_buy/Models/GoogleMapMarkerModel.dart';


// ignore: must_be_immutable
class GoogleMapPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  Set<GoogleMapMarkerModel> googleMapMarkers;

   GoogleMapPage({Key? key,required this.googleMapMarkers}) : super(key: key);



  @override
  // ignore: no_logic_in_create_state
  State<GoogleMapPage> createState() => _GoogleMapPageState(googleMapMarkers);
}

class _GoogleMapPageState extends State<GoogleMapPage> {


  GoogleMapController? mapController; //contrller for Google map
  LatLng showLocation =
      const LatLng(24.527579, 81.109152);

  Set<Marker> markers ={};

  Set<GoogleMapMarkerModel> googleMapMarkers;
  _GoogleMapPageState(this.googleMapMarkers);




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
        zoom: 10.0,
      ),
      markers: markers,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      onMapCreated: (controller) { //method called when map is created
        setState(() {
          mapController = controller;
        });
      },
    );
  }

  @override
  void initState()  {

    if(googleMapMarkers.isEmpty){
      getLocation();
      //
      // markers.add(Marker(
      //   //add marker on google map
      //   markerId: MarkerId(showLocation.toString()),
      //   position: showLocation, //position of marker
      //   infoWindow: const InfoWindow(
      //     //popup info
      //     title: 'Current Location',
      //     snippet: 'My Current location',
      //   ),
      //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      //
      // ));
    }
    else{
      markers.clear();
      for( GoogleMapMarkerModel marker in googleMapMarkers ){

        markers.add(Marker(
          //add marker on google map
          markerId: MarkerId(marker.id.toString()),
          position: marker.position, //position of marker
          infoWindow:  InfoWindow(
            //popup info
            title: marker.title,
            snippet: marker.subTitle,
          ),
          icon: marker.icon,//Icon for Marker
          onTap: (){}

        ));
      }
    }
    super.initState();
  }

  Location currentLocation = Location();
  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){

      mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
    });
  }



}
