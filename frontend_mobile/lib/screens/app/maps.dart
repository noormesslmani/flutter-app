import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'package:frontend_mobile/services/location_service.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _Beirut = CameraPosition(
    target: LatLng(33.888630, 35.495480),
    zoom: 12,
  );

  final List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId('1'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(33.888630, 35.495480),
      infoWindow: InfoWindow(
        title: 'Beirut',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Maps',
        showBack: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set<Marker>.of(_markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        initialCameraPosition: _Beirut,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          LocationService.determinePosition().then((value) async {
            _gotToCurrentLocation(value);
          });
        },
        label: const Text('To current location!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _gotToCurrentLocation(value) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(value.latitude, value.longitude),
          tilt: 59.440717697143555,
          zoom: 15,
        ),
      ),
    );
  }
}
