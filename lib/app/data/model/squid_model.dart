// To parse this JSON data, do
//
//     final squidModel = squidModelFromJson(jsonString);

import 'dart:convert';

SquidModel squidModelFromJson(String str) => SquidModel.fromJson(json.decode(str));

String squidModelToJson(SquidModel data) => json.encode(data.toJson());

class SquidModel {
  SquidModel({
    this.results,
  });

  List<Result>? results;

  static fromJson(dynamic json) => SquidModel(
    results: List<Result>.from(json["results"].map((x) => Result?.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.businessStatus,
    this.formattedAddress,
    this.geometry,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
  });

  String? businessStatus;
  String? formattedAddress;
  Geometry? geometry;
  String? name;
  OpeningHours? openingHours;
  List<Photo>? photos;
  String? placeId;
  double? rating;
  String? reference;
  List<String>? types;
  int? userRatingsTotal;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    businessStatus: json["business_status"],
    formattedAddress: json["formatted_address"],
    geometry: Geometry.fromJson(json["geometry"]),
    name: json["name"],
    photos: json['photos'] != null ? json['photos'].map<Photo>((x) => Photo.fromJson(x)).toList() : <Photo>[],
    openingHours: json["opening_hours"] != null ? OpeningHours.fromJson(json["opening_hours"]) : OpeningHours.fromJson({"open_now": false}),
    placeId: json["place_id"],
    rating: json["rating"].toDouble(),
    reference: json["reference"],
    types: List<String>.from(json["types"].map((x) => x)),
    userRatingsTotal: json["user_ratings_total"],
  );

  Map<String, dynamic> toJson() => {
    "business_status": businessStatus,
    "formatted_address": formattedAddress,
    "geometry": geometry?.toJson(),
    "name": name,
    "opening_hours": openingHours?.toJson(),
    "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
    "place_id": placeId,
    "rating": rating,
    "reference": reference,
    "types": List<dynamic>.from(types!.map((x) => x)),
    "user_ratings_total": userRatingsTotal,
  };
}

class Geometry {
  Geometry({
    this.location,
  });

  Location? location;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    location: Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
  };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  String? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
    openNow: json["open_now"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow,
  };
}

class Photo {
  Photo({
    this.photoReference,
    this.width,
  });
  String? photoReference;
  int? width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    photoReference: json["photo_reference"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "photo_reference": photoReference,
    "width": width,
  };
}
