

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants{
  Constants._();

  static const DB_USER_KEY = 'session';
  static const DB_SQUID_MODEL_KEY = 'squid-model';
  static const DB_SQUID_DETAIL_KEY = 'squid-detail-model';
  // firestore
  static const USERS = 'users';

  // google map api
  static const BASE_API = 'https://maps.googleapis.com/maps/api/place';
  static const MAP_API_KEY = 'AIzaSyDLMpS9kCdAqdaSjLlaRvGmQgG7iK2DUOg';
  static const IMAGE_URL = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=';
  static const API_DETAIL = 'https://maps.googleapis.com/maps/api/place';

  static const double CAMERA_ZOOM_INIT = 15;
  static const double CAMERA_TILT = 0;
  static const double CAMERA_BEARING = 30;
  static const LatLng SOURCE_LOCATION =
  LatLng(-8.582572687412386, 116.1013248977757);
}