import 'package:flutter/services.dart';
import 'package:frontend_mobile/services/location_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:geolocator/geolocator.dart';

class MapUtilities {
  
  Uint8List? byteData;


  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    byteData = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
    return byteData;
  }

  static Future<void> getRoute(
      PolylinePoints polylinePoints,
      LatLng? initialLocation,
      List<LatLng> polylineCoordinates,
      LatLng locations) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      dotenv.env['GOOGLE_MAPS_API_KEY'].toString(),
      PointLatLng(initialLocation!.latitude, initialLocation!.longitude),
      PointLatLng(locations.latitude, locations.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
  }

  static void addPolyLine(
      List<LatLng> polylineCoordinates, Map<PolylineId, Polyline> polylines) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 3,
      geodesic: true,
    );
    polylines[id] = polyline;
  }

  static double calculateDistance(LatLng location1, LatLng location2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((location2.latitude - location1.latitude) * p) / 2 +
        cos(location1.latitude * p) *
            cos(location2.latitude * p) *
            (1 - cos((location2.longitude - location1.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
