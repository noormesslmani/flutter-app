import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:frontend_mobile/widgets/app_bar.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/services/location_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:frontend_mobile/utilities/maps_utilities.dart';
import 'package:frontend_mobile/widgets/modals/map_modal.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  Set<Marker> markers = {};
  Uint8List? byteData;
  LatLng? _currentLocation;
  LatLng defaultLocation = const LatLng(33.888630, 35.495480);
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  String _distance = '';
  String _duration = '';
  bool _showCard = false;
  LatLng? _pressedLocation;
  GoogleMapController? mapController;
  @override
  void initState() {
    getBytesFromAsset("assets/images/pin4.png", 100);
    setInitialLocation();
    super.initState();
  }

  void getBytesFromAsset(String path, int width) async {
    await MapUtilities().getBytesFromAsset(path, width).then(
      (value) {
        setState(() {
          byteData = value;
        });
      },
    );
  }

  Future<void> setInitialLocation() async {
    debugPrint('loading');
    try {
      await MapUtilities.determinePosition().then(((value) {
        setState(() {
          _currentLocation = LatLng(value.latitude, value.longitude);
        });
      }));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locations =
        ModalRoute.of(context)?.settings.arguments as List<LatLng>;

    // void onMapcreated(GoogleMapController controller) {}
    Set<Marker> getmarkers() {
      setState(
        () {
          for (int i = 0; i < locations.length; i++) {
            markers.add(
              Marker(
                markerId: MarkerId(i.toString()),
                icon: BitmapDescriptor.fromBytes(byteData!),
                position: locations[i],
                onTap: () async {
                  setState(() {
                    _showCard = false;
                  });
                  polylineCoordinates.clear();
                  try {
                    await LocationService.getDistanceMatrix(
                            locations[i], _currentLocation!)
                        .then(
                      (value) {
                        setState(() {
                          _distance =
                              value!.rows![0].elements![0].distance!.text!;
                          _duration =
                              value.rows![0].elements![0].duration!.text!;
                          _pressedLocation = locations[i];
                        });
                      },
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                    setState(() {
                      _distance = 'N/A';
                      _duration = 'N/A';
                      _pressedLocation = locations[i];
                    });
                  }
                  setState(() {
                    _showCard = true;
                  });
                },
              ),
            );
          }
        },
      );
      return markers;
    }

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Maps',
        showBack: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          byteData != null
              ? GoogleMap(
                  polylines: Set<Polyline>.of(polylines.values),
                  mapType: MapType.normal,
                  markers: getmarkers(),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: _currentLocation ?? defaultLocation,
                    zoom: 12,
                  ),
                  onMapCreated: ((controller) {
                    setState(() {
                      mapController = controller;
                    });
                  }),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: _showCard
                ? MapUtilities.showUserCard(
                    _distance,
                    _duration,
                    () async {
                      await MapUtilities.getRoute(
                        polylinePoints,
                        _currentLocation,
                        polylineCoordinates,
                        _pressedLocation!,
                      );

                      MapUtilities.addPolyLine(polylineCoordinates, polylines);
                      setState(() {});
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
