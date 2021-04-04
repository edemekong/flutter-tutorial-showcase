import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/user.dart';
import 'package:flutter_tutorials/view_model/map_model/map_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  final User user;
  const MapView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapModel(user),
      builder: (context, snapshot) {
        return Scaffold(
          body: Builder(builder: (context) {
            final mapModel = Provider.of<MapModel>(context);
            return mapModel.markers.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Stack(
                    children: <Widget>[
                      GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target:
                                mapModel.userPosition == null ? LatLng(29.457200, -164.299000) : mapModel.userPosition,
                            zoom: mapModel.userPosition == null ? 2 : 10),
                        myLocationEnabled: true,
                        onMapCreated: mapModel.onMapCreate,
                        onCameraMove: mapModel.onCameraMoved,
                        markers: mapModel.markers,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  );
          }),
        );
      },
    );
  }
}
