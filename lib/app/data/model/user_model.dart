import 'dart:convert';

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? photoUrl;
  int? totalPoint;
  String? lastSign;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.totalPoint,
      this.lastSign});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      totalPoint: data['total_point'],
      lastSign: data['lastSign'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "photoUrl": photoUrl,
        "total_point": totalPoint,
        "lastSign": lastSign,
      };
}
