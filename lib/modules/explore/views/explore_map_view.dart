import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreMapView extends StatelessWidget {
  static const CameraPosition _myLocation = CameraPosition(
    target: LatLng(13.745346175945313, 100.53913506845217),
    zoom: 15,
  );

  const ExploreMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      markers: {
        Marker(
          markerId: const MarkerId('My Location'),
          position: _myLocation.target,
        ),
      },
      initialCameraPosition: _myLocation,
    );
  }
}
