import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:location/location.dart';
import 'package:spot_buy/Utils/SpotColors.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);


  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  // final LatLng _initialcameraposition = const LatLng(24.527579, 81.109152);
  // late GoogleMapController _controller;
  // Location _location = Location();
  //
  // final CameraPosition initCamPosition = CameraPosition(target: _initialcameraposition,zoom: 10);
  //

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: SpotColors.colorYellow,
        child:Stack(
          children: const [
            Text("data"),

          ],
        )

          );
  }

  //
  // void _onMapCreated(GoogleMapController _cntlr)
  // {
  //   _controller = _cntlr;
  //   _location.onLocationChanged.listen((l) {
  //     _controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 10),
  //       ),
  //     );
  //   });
  // }
}
