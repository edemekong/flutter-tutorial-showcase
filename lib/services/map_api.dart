import 'package:flutter_tutorials/ui/constants/map_key.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleMapApi {
  static GoogleMapApi _instance;

  GoogleMapApi._();

  static GoogleMapApi get instance {
    if (_instance == null) {
      _instance = GoogleMapApi._();
    }
    return _instance;
  }

  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=${MapKey.apiKey}";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values['routes'][0]['overview_polyline']['points'];
  }
}
