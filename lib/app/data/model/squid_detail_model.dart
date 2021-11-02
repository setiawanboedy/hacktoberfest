// To parse this JSON data, do
//
//     final squidDetailModel = squidDetailModelFromJson(jsonString);

import 'dart:convert';

SquidDetailModel squidDetailModelFromJson(String str) => SquidDetailModel.fromJson(json.decode(str));

String squidDetailModelToJson(SquidDetailModel data) => json.encode(data.toJson());

class SquidDetailModel {
  SquidDetailModel({
    this.result,
  });

  Result? result;

  static fromJson(dynamic json) => SquidDetailModel(
    result: Result?.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
  };
}

class Result {
  Result({
    this.formattedAddress,
    this.geometry,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.rating,
    this.reviews,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.vicinity,
    this.website,
  });

  String? formattedAddress;
  Geometry? geometry;
  String? name;
  OpeningHours? openingHours;
  List<Photo>? photos;
  String? placeId;
  double? rating;
  List<Review>? reviews;
  List<String>? types;
  String? url;
  int? userRatingsTotal;
  String? vicinity;
  String? website;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    formattedAddress: json["formatted_address"],
    geometry: Geometry.fromJson(json["geometry"]),
    name: json["name"],
    openingHours: json["opening_hours"] != null ? OpeningHours.fromJson(json["opening_hours"]) : OpeningHours.fromJson({"open_now": false}),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    placeId: json["place_id"],
    rating: json["rating"] ?? 0.0,
    reviews: json["reviews"] != null ? json['reviews'].map<Review>((x) => Review.fromJson(x)).toList() : <Review>[],
    types: List<String>.from(json["types"].map((x) => x)),
    url: json["url"],
    userRatingsTotal: json["user_ratings_total"],
    vicinity: json["vicinity"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "formatted_address": formattedAddress,
    "geometry": geometry?.toJson(),
    "name": name,
    "opening_hours": openingHours?.toJson(),
    "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
    "place_id": placeId,
    "rating": rating,
    "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "types": List<dynamic>.from(types!.map((x) => x)),
    "url": url,
    "user_ratings_total": userRatingsTotal,
    "vicinity": vicinity,
    "website": website,
  };
}

class AddressComponent {
  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  String? longName;
  String? shortName;
  List<String>? types;

  factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
    longName: json["long_name"],
    shortName: json["short_name"],
    types: List<String>.from(json["types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "long_name": longName,
    "short_name": shortName,
    "types": List<dynamic>.from(types!.map((x) => x)),
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

  bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
    openNow: json["open_now"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow,
  };
}


class Photo {
  Photo({
    this.height,
    this.photoReference,
    this.width,
  });

  int? height;
  String? photoReference;
  int? width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    height: json["height"],
    photoReference: json["photo_reference"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "photo_reference": photoReference,
    "width": width,
  };
}

class Review {
  Review({
    this.authorName,
    this.authorUrl,
    this.language,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text,
    this.time,
  });

  String? authorName;
  String? authorUrl;
  String? language;
  String? profilePhotoUrl;
  int? rating;
  String? relativeTimeDescription;
  String? text;
  int? time;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    authorName: json["author_name"],
    authorUrl: json["author_url"],
    language: json["language"],
    profilePhotoUrl: json["profile_photo_url"],
    rating: json["rating"],
    relativeTimeDescription: json["relative_time_description"],
    text: json["text"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "author_name": authorName,
    "author_url": authorUrl,
    "language": language,
    "profile_photo_url": profilePhotoUrl,
    "rating": rating,
    "relative_time_description": relativeTimeDescription,
    "text": text,
    "time": time,
  };
}
