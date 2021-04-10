import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/geopoint.dart';
import 'package:flutter_tutorials/models/nearby.dart';
import 'package:flutter_tutorials/models/user.dart';
import 'package:flutter_tutorials/services/map_api.dart';
import 'package:flutter_tutorials/services/nearby_location_api.dart';
import 'package:flutter_tutorials/services/user_api.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel extends ChangeNotifier {
  GoogleMapController _mapController;

  String userPositionName = '';
  LatLng userPosition;
  List<Nearby> nearbyLocations = <Nearby>[];

  GoogleMapController get mapController => _mapController;
  List<User> users = [];

  final Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  MapModel(User user) {
    if (user == null) {
      addAllUserMakerToMap();
    } else {
      getUserPosition(user);
    }
  }

  Future<void> addAllUserMakerToMap() async {
    var allUser = await UserApi.instance.getAllUser();
    print("runin...");
    allUser.forEach((user) async {
      await _addMarkerToMap(
        markerPosition: GeoPoint(double.parse(user.address.geo.lat), double.parse(user.address.geo.lng)),
        placeName: '${user.address.city}',
      );
      users.add(user);
    });
  }

  Future<void> getUserPosition(User user) async {
    print(user.address.geo.lat);
    GeoPoint point = GeoPoint(double.parse(user.address.geo.lat), double.parse(user.address.geo.lng));
    userPosition = LatLng(point.latitude, point.longitude);
    List<Placemark> placeMarks = await placemarkFromCoordinates(userPosition.latitude, userPosition.longitude);
    Placemark marks = placeMarks[0];
    _addMarkerToMap(markerPosition: point, placeName: '${user.username}');
    userPositionName = '${marks.name},\n${marks.locality}, ${marks.administrativeArea}.';
    // _moveCameraToUserLocation(userPosition);
  }

  Future<void> _addMarkerToMap({GeoPoint markerPosition, String placeName}) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(markerPosition.latitude, markerPosition.longitude);
      Placemark marks = placeMarks[0];
      var points = LatLng(markerPosition.latitude, markerPosition.longitude);
      _markers.add(Marker(
          markerId: MarkerId(placeName),
          position: points,
          onTap: () async {
            final List<Nearby> result = await NearcyLocationApi.instance.getNearby(
                userLocation:
                    // markerPosition,
                    GeoPoint(4.8119283, 7.046236272219636),
                radius: 1000,
                type: 'restaurants',
                keyword: '');
            nearbyLocations = result;

            notifyListeners();
          },
          infoWindow: InfoWindow(
            title: placeName,
            snippet: "${marks.name},${marks.locality}, ${marks.administrativeArea}",
          ),
          icon: BitmapDescriptor.defaultMarker));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void onMapCreate(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void onCameraMoved(CameraPosition position) {
    userPosition = position.target;
    notifyListeners();
  }

  void _moveCameraToUserLocation(LatLng newPosition) async {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: newPosition,
          zoom: 15,
        ),
      ),
    );
  }
}
