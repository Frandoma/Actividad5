import 'package:flutter/material.dart';
import 'package:flutter_application_1/coordenadas_service.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMapWidget(),
    );
  }
}
