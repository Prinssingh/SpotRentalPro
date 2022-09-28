import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapMarkerModel {
  late String id;
  late String title;
  late String subTitle;
  late LatLng position;
  late BitmapDescriptor icon;
  late String category;


  GoogleMapMarkerModel( this.title, this.subTitle,this.category,this.position)  {
   id = category+"_"+title;

    switch(category){
      case "charging":
        // BitmapDescriptor.fromAssetImage(
        //     const ImageConfiguration(size: Size(48, 48)), "assets/images/charging_map_pin.png")
        //     .then((onValue) {
        //   icon = onValue;
        // });

        icon=  BitmapDescriptor.defaultMarker ;
         break;

      case "fuel":
        BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)), "assets/images/fuel_map_pin.png")
            .then((onValue) {
          icon = onValue;
        });
        icon= BitmapDescriptor.fromAssetImage( const ImageConfiguration(size: Size(48, 48)), "assets/images/fuel_map_pin.png") as BitmapDescriptor ;
        break;
    }
  }

  // declared method to get Images
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }

}