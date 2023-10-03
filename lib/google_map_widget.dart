import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/coordenadas_service.dart';

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    CoordenadasService().cargarCoordenadasEnMapa(_markers);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(0, 0), // Cambia esto a la ubicación inicial deseada.
        zoom: 10,
      ),
      markers: _markers,
    );
  }
}
