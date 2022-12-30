import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/models/distance_matrix.dart';
import 'dart:convert';

class LocationService {
  static Future<DistanceMatrix> getDistanceMatrix(
      LatLng location1, LatLng location2) async {
    try {
      var response = await Dio().get(
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${location1.latitude},${location1.longitude}&origins=${location2.latitude},${location2.longitude}&key=${dotenv.env['GOOGLE_MAPS_API_KEY']}');
      final data = json.decode(response.toString());

      return DistanceMatrix.fromJson(data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
