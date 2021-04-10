class Nearby {
  String businessStatus;
  Geometry geometry;
  String icon;
  String name;
  OpeningHours openingHours;
  List<Photos> photos;
  String placeId;
  PlusCode plusCode;
  dynamic priceLevel;
  dynamic rating;
  String reference;
  String scope;
  List<String> types;
  dynamic userRatingsTotal;
  String vicinity;

  Nearby(
      {this.businessStatus,
      this.geometry,
      this.icon,
      this.name,
      this.openingHours,
      this.photos,
      this.placeId,
      this.plusCode,
      this.priceLevel,
      this.rating,
      this.reference,
      this.scope,
      this.types,
      this.userRatingsTotal,
      this.vicinity});

  Nearby.fromJson(Map<String, dynamic> json) {
    businessStatus = json['business_status'];
    geometry = json['geometry'] != null ? new Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    name = json['name'];
    openingHours = json['opening_hours'] != null ? new OpeningHours.fromJson(json['opening_hours']) : null;
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    plusCode = json['plus_code'] != null ? new PlusCode.fromJson(json['plus_code']) : null;
    priceLevel = json['price_level'];
    rating = json['rating'];
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'].cast<String>();
    userRatingsTotal = json['user_ratings_total'];
    vicinity = json['vicinity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_status'] = this.businessStatus;
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    data['icon'] = this.icon;
    data['name'] = this.name;
    if (this.openingHours != null) {
      data['opening_hours'] = this.openingHours.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['place_id'] = this.placeId;
    if (this.plusCode != null) {
      data['plus_code'] = this.plusCode.toJson();
    }
    data['price_level'] = this.priceLevel;
    data['rating'] = this.rating;
    data['reference'] = this.reference;
    data['scope'] = this.scope;
    data['types'] = this.types;
    data['user_ratings_total'] = this.userRatingsTotal;
    data['vicinity'] = this.vicinity;
    return data;
  }
}

class Geometry {
  Location location;
  Viewport viewport;

  Geometry({this.location, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    viewport = json['viewport'] != null ? new Viewport.fromJson(json['viewport']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.viewport != null) {
      data['viewport'] = this.viewport.toJson();
    }
    return data;
  }
}

class Location {
  dynamic lat;
  dynamic lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Viewport {
  Location northeast;
  Location southwest;

  Viewport({this.northeast, this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null ? new Location.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? new Location.fromJson(json['southwest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest.toJson();
    }
    return data;
  }
}

class OpeningHours {
  bool openNow;

  OpeningHours({this.openNow});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json['open_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open_now'] = this.openNow;
    return data;
  }
}

class Photos {
  dynamic height;
  List<String> htmlAttributions;
  String photoReference;
  dynamic width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'].cast<String>();
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['html_attributions'] = this.htmlAttributions;
    data['photo_reference'] = this.photoReference;
    data['width'] = this.width;
    return data;
  }
}

class PlusCode {
  String compoundCode;
  String globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  PlusCode.fromJson(Map<String, dynamic> json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_code'] = this.compoundCode;
    data['global_code'] = this.globalCode;
    return data;
  }
}
