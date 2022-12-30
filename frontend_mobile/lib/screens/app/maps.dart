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
  LatLng? _initialLocation;
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  String _distance = '';
  String _duration = '';
  @override
  void initState() {
    getBytesFromAsset("assets/images/pin4.png", 100);
    setInitialLocation();
    super.initState();
  }

  void getBytesFromAsset(String path, int width) async {
    setState(() async {
      byteData = await MapUtilities().getBytesFromAsset(path, width);
    });
  }

  void setInitialLocation() async {
    debugPrint('loading');
    try {
      await MapUtilities.determinePosition().then(((value) {
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

  @override
  Widget build(BuildContext context) {
    final locations =
        ModalRoute.of(context)?.settings.arguments as List<LatLng>;
    void onMapcreated(GoogleMapController controller) async {
      setState(
        () {
          for (int i = 0; i < locations.length; i++) {
            markers.add(
              Marker(
                onTap: () async {
                  try {
                    await LocationService.getDistanceMatrix(
                            locations[i], _initialLocation!)
                        .then(
                      (value) {
                        setState(() {
                          _distance =
                              value!.rows![0].elements![0].distance!.text!;
                          _duration =
                              value.rows![0].elements![0].duration!.text!;
                        });
                      },
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }

                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return MapModal(
                        distance: _distance,
                        duration: _duration,
                        name: 'Dr Nour Messlmani',
                        onArrowPress: () {},
                        onButtonPress: () async {
                          await MapUtilities.getRoute(
                            polylinePoints,
                            _initialLocation,
                            polylineCoordinates,
                            locations[i],
                          );
                          MapUtilities.addPolyLine(
                              polylineCoordinates, polylines);
                          setState(() {});
                        },
                        rating: 4,
                      );
                    },
                  );
                },
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

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'Maps',
        showBack: true,
      ),
      body: _initialLocation != null
          ? GoogleMap(
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
