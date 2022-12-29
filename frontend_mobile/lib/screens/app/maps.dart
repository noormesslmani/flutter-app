import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  Set<Marker> markers = {};
  Uint8List? byteData;
  LatLng? _initialLocation;

  @override
  void initState() {
    getBytesFromAsset("assets/images/pin3.png", 100);
    setInitialLocation();
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

  void setInitialLocation() async {
    debugPrint('loading');
    try {
      await LocationService.determinePosition().then(((value) {
        setState(() {
          _initialLocation = LatLng(value.latitude, value.longitude);
        });
      }));
    } catch (error) {
      setState(() {
        _initialLocation = const LatLng(33.888630, 35.495480);
      });
    }
  }

  void onMapcreated(GoogleMapController controller) {
    final locations =
        ModalRoute.of(context)?.settings.arguments as List<LatLng>;
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
      body: _initialLocation != null
          ? GoogleMap(
              mapType: MapType.normal,
              markers: markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _initialLocation!,
                zoom: 12,
              ),
              onMapCreated: onMapcreated,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
