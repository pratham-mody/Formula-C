// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:foodtruck/core/constants/constants.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapsScreen extends StatefulWidget {
//   const MapsScreen({Key? key}) : super(key: key);

//   @override
//   State<MapsScreen> createState() => _MapsScreenState();
// }

// class _MapsScreenState extends State<MapsScreen> {
//   final Completer<GoogleMapController> controller = Completer();
//   String google_api_key="AIzaSyAZ6My-DMfYoz08vt3U-VFdqyBIW3-rL3c";
//   static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
//   static const LatLng destination = LatLng(37.33429383, -122.06600055);

//   List<LatLng> polylineCoordinates = [];
//   LocationData? currentLocation;

//   BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

//   void getCurrentLocation() async {
//     Location location = Location();

//     location.getLocation().then((location) {
//       currentLocation = location;
//     });
//     GoogleMapController googleMapController = (await controller.future);
//     location.onLocationChanged.listen((event) {
//       currentLocation = event;
//       googleMapController.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(
//               zoom: 13.5, target: LatLng(event.latitude!, event.longitude!))));
//       setState(() {});
//     });
//   }

//   void setCustomMarkerIcon() {
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/images/source.png")
//         .then((icon) {
//       sourceIcon = icon;
//     });
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/images/destination.png")
//         .then((icon) {
//       destinationIcon = icon;
//     });
//     BitmapDescriptor.fromAssetImage(
//             ImageConfiguration.empty, "assets/images/truck.png")
//         .then((icon) {
//       currentLocationIcon = icon;
//     });
//   }

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         google_api_key,
//         PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//         PointLatLng(destination.latitude, destination.longitude));

//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) =>
//           polylineCoordinates.add(LatLng(point.latitude, point.longitude)));

//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//     getPolyPoints();
//     setCustomMarkerIcon();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentLocation == null
//           ? const Center(
//               child: Text("Loading"),
//             )
//           : GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(
//                       currentLocation!.latitude!, currentLocation!.longitude!),
//                   zoom: 14.5),
//               polylines: {
//                 Polyline(
//                     polylineId: PolylineId("route"),
//                     points: polylineCoordinates,
//                     color: Colors.green,
//                     width: 6)
//               },
//               markers: {
//                 Marker(
//                     markerId: MarkerId("currentLocation"),
//                     icon: currentLocationIcon,
//                     position: LatLng(currentLocation!.latitude!,
//                         currentLocation!.longitude!)),
//                 Marker(
//                     markerId: MarkerId("source"),
//                     icon: sourceIcon,
//                     position: sourceLocation),
//                 Marker(
//                     markerId: MarkerId("destination"),
//                     icon: destinationIcon,
//                     position: destination)
//               },
//               onMapCreated: (mapController) {
//                 controller.complete(mapController);
//               },
//             ),
//     );
//   }
// }
