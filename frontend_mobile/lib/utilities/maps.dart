import 'package:flutter/services.dart';
import 'package:frontend_mobile/services/location_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MapUtilities {
  Uint8List? byteData;
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

  static Future<void> getRoute(PolylinePoints polylinePoints, LatLng? initialLocation,
      List<LatLng> polylineCoordinates, List<LatLng> locations) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      dotenv.env['GOOGLE_MAPS_API_KEY'].toString(),
      PointLatLng(initialLocation!.latitude, initialLocation!.longitude),
      PointLatLng(locations[0].latitude, locations[0].longitude),
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
    );
    polylines[id] = polyline;
  }
}
