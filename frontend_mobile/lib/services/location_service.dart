import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/models/distance_matrix.dart';
import 'dart:convert';

class LocationService {
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

  static Future<DistanceMatrix?> getDistanceMatrix(
      LatLng location1, LatLng location2) async {
    try {
      var response = await Dio().get(
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${location1.latitude},${location1.longitude}&origins=${location2.latitude},${location2.longitude}&key=${dotenv.env['GOOGLE_MAPS_API_KEY']}');
      final data = json.decode(response.toString());

      return DistanceMatrix.fromJson(data);
    } catch (e) {
      print(e);
    }
  }
}
