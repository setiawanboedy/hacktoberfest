// To parse this JSON data, do
//
//     final markerModel = markerModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

MarkerModel markerModelFromJson(String str) => MarkerModel.fromJson(json.decode(str));

String markerModelToJson(MarkerModel data) => json.encode(data.toJson());

class MarkerModel {
  MarkerModel({
    this.result,
  });

  List<Result>? result;

  factory MarkerModel.fromJson(Map<String, dynamic> json) => MarkerModel(
    result: List<Result>.from(json["result"]?.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.image,
    this.location,
    this.name,
    this.point,
    this.status,
    this.markerId,
    this.time,
  });

  String? image;
  GeoPoint? location;
  String? name;
  String? point;
  String? status;
  String? markerId;
  String? time;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    image: json["image"],
    location: json["location"],
    name: json["name"],
    point: json["point"],
    status: json["status"],
    markerId: json["markerId"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "location": location,
    "name": name,
    "point": point,
    "status": status,
    "time": time,
  };
}
