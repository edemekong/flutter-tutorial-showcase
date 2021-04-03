import 'dart:ui';

class GeoPoint {
  /// Create [GeoPoint] instance.
  const GeoPoint(this.latitude, this.longitude)
      : assert(latitude >= -90 && latitude <= 90),
        assert(longitude >= -180 && longitude <= 180);

  final double latitude; // ignore: public_member_api_docs
  final double longitude; // ignore: public_member_api_docs

  @override
  bool operator ==(dynamic o) => o is GeoPoint && o.latitude == latitude && o.longitude == longitude;

  @override
  int get hashCode => hashValues(latitude, longitude);
}
