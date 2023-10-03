import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoordenadasService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registrarCoordenadas() async {
    final Position position = await Geolocator.getCurrentPosition();
    await _firestore.collection('coordenadas').add({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void cargarCoordenadasEnMapa(Set<Marker> markers) {
    _firestore.collection('coordenadas').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final lat = data['latitude'] as double;
        final long = data['longitude'] as double;

        markers.add(
          Marker(
            markerId: MarkerId(doc.id),
            position: LatLng(lat, long),
            onTap: () {
              // Mostrar detalles adicionales cuando se toque el marcador.
              // Puedes implementar esto aquí.
            },
          ),
        );
      });
    });
  }
}
