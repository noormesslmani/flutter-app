import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:frontend_mobile/services/location_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  Set<Marker> markers = {};
  Uint8List? byteData;
  LatLng? _initialLocation;
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
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

  void onMapcreated(GoogleMapController controller) async {
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

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 2,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final locations =
        ModalRoute.of(context)?.settings.arguments as List<LatLng>;
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Maps',
        showBack: true,
      ),
      body: _initialLocation != null
          ? Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                GoogleMap(
                  polylines: Set<Polyline>.of(polylines.values),
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
                ),
                locations.length == 1
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FloatingActionButton(
                          child: const Icon(Icons.route),
                          onPressed: () async {
                            PolylineResult result =
                                await polylinePoints.getRouteBetweenCoordinates(
                              dotenv.env['GOOGLE_MAPS_API_KEY'].toString(),
                              PointLatLng(_initialLocation!.latitude,
                                  _initialLocation!.longitude),
                              PointLatLng(locations[0].latitude,
                                  locations[0].longitude),
                              travelMode: TravelMode.driving,
                            );

                            if (result.points.isNotEmpty) {
                              for (var point in result.points) {
                                polylineCoordinates.add(
                                    LatLng(point.latitude, point.longitude));
                              }
                            } else {
                              print(result.errorMessage);
                            }

                            addPolyLine(polylineCoordinates);
                          },
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
