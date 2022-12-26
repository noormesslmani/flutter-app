import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/services.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  Set<Marker> markers = {};
  Uint8List? byteData;
  final List<LatLng> locations = <LatLng>[
    const LatLng(-9.81967, -67.50781),
    const LatLng(25.84769, 38.57712),
    const LatLng(21.24830, 81.56812),
    const LatLng(-5.14471, 30.96037),
    const LatLng(58.95652, 46.02342),
    const LatLng(52.29517, -76.58306),
    const LatLng(6.74938, 14.55162),
    const LatLng(0.97975, -60.86465),
    const LatLng(34.92413, 43.16627),
  ];

  @override
  void initState() {
    getBytesFromAsset("assets/images/pin3.png", 100);
    super.initState();
  }

  void getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    setState(() async {
      byteData = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
          .buffer
          .asUint8List();
    });
  }

  void onMapcreated(GoogleMapController controller) {
    setState(
      () {
        for (int i = 0; i < locations.length; i++) {
          markers.add(
            Marker(
              markerId: MarkerId(i.toString()),
              icon: BitmapDescriptor.fromBytes(byteData!),
              position: locations[i],
              infoWindow: InfoWindow(
                title: 'Location: $i',
              ),
            ),
          );
        }
      },
    );
  }

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
        markers: markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(33.888630, 35.495480),
          zoom: 12,
        ),
        onMapCreated: onMapcreated,
      ),
    );
  }
}
