class SquidModel{
  String? id;
  String? imageUrl;
  String? locationName;
  String? distance;

  SquidModel({this.id, this.imageUrl, this.locationName, this.distance});

  factory SquidModel.fromMap(Map data) {
    return SquidModel(
      id: data['id'],
      imageUrl: data['imageUrl'] ?? '',
      locationName: data['locationName'] ?? '',
      distance: data['distance'] ?? '',
    );
  }
}