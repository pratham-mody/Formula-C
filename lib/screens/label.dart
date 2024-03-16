import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Label extends StatefulWidget {
  const Label({super.key});

  @override
  State<Label> createState() => LabelState();
}

class LabelState extends State<Label> {
  static const LatLng _cGooglePlex=LatLng(19.197755078634067, 72.82720375205461);
    static const LatLng _dGooglePlex=LatLng(19.211443071971722, 72.84050548089076);
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
// 19.197755078634067, 72.82720375205461
  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(19.197755078634067, 72.82720375205461),
  //   zoom: 14.4746,
  // );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(19.197755078634067, 72.82720375205461),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _cGooglePlex,zoom: 13),
        markers: {Marker(markerId: MarkerId("_currentLocation"),
        icon: BitmapDescriptor.defaultMarker,position: _cGooglePlex),
        Marker(markerId: MarkerId("_sourceLocation"),
        icon: BitmapDescriptor.defaultMarker,position: _dGooglePlex)},        
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!',style:TextStyle(color: Colors.white),),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}