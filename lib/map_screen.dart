import 'package:flutter/material.dart';
import 'package:flutter_application_1/coordenadas_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Coordenadas'),
      ),
      body: MapWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await CoordenadasService().registrarCoordenadas();
        },
        child: Icon(Icons.add_location),
      ),
    );
  }
}
