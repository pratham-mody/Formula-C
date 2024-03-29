import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> controller = Completer();

  static const LatLng sourceLocation =
      LatLng(19.2135, 72.8408);
  static const LatLng destination =
      LatLng(19.2063, 72.8746);

  List<LatLng> polylineCoordinates = [];
  Position? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  String google_api_key = "AIzaSyAK7YNv6ksviRCetiOFUZvdIWyAAg4R26w";

  Future<void> setCustomMarkerIcon() async {
    final double iconSize = 20;
    final sourceIconBitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(2, 20)),
      "assets/source.png",
    );
    final destinationIconBitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)),
      "assets/destination.png",
    );
    final truckIconBitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)),
      "assets/truck.png",
    );

    setState(() {
      sourceIcon = sourceIconBitmap;
      destinationIcon = destinationIconBitmap;
      currentLocationIcon = truckIconBitmap;
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    // getCurrentLocation();
    getPolyPoints();
    setCustomMarkerIcon();
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentLocation = position;
    });

    GoogleMapController googleMapController = (await controller.future);
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 13.5,
            target: LatLng(position.latitude, position.longitude))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(sourceLocation.latitude, sourceLocation.longitude),
            zoom: 14.5),
        polylines: {
          Polyline(
              polylineId: PolylineId("route"),
              color: Colors.black,
              points: polylineCoordinates,
              width: 3)
        },
        markers: {
          Marker(
              markerId: MarkerId("currentLocation"),
              icon: currentLocationIcon,
              position: LatLng(
                  currentLocation?.latitude ?? sourceLocation.latitude,
                  currentLocation?.longitude ?? sourceLocation.longitude)),
          Marker(
              markerId: MarkerId("source"),
              icon: sourceIcon,
              position: destination),
          Marker(
              markerId: MarkerId("destination"),
              icon: destinationIcon,
              position: sourceLocation)
        },
        onMapCreated: (mapController) {
          controller.complete(mapController);
        },
      ),
    );
  }
}
