import 'dart:convert';
import 'package:get/get.dart';
import './env.dart';

abstract class GoogleService {
  Future<GoogleApiNearbySearchResponse> getNearbyRestaurants(
      double latitude, double longitude);
}

class GoogleApi extends GetConnect implements GoogleService {
  Future<GoogleApi> init() async {
    return this;
  }

  @override
  Future<GoogleApiNearbySearchResponse> getNearbyRestaurants(
      double latitude, double longitude) async {
    final response = await get(
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
      query: {
        'location': '$latitude,$longitude',
        'radius': '1500',
        'type': 'restaurant',
        'key': Env.GOOGLE_MAP_API_KEY,
      },
    );

    // TODO: Handle error
    // if (response.status.hasError) {
    //   return Future.error(response.statusText);
    // }
    return GoogleApiNearbySearchResponse.fromJson(
        jsonDecode(response.bodyString!));
  }
}

class GoogleApiNearbySearchResponse {
  List<GoogleApiNearbySearchResult>? results;
  String? status;

  GoogleApiNearbySearchResponse({this.results, this.status});

  GoogleApiNearbySearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <GoogleApiNearbySearchResult>[];
      json['results'].forEach((v) {
        results!.add(GoogleApiNearbySearchResult.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class GoogleApiNearbySearchResult {
  String? name;
  double? rating;
  GoogleApiNearbySearchResult({this.name, this.rating});

  GoogleApiNearbySearchResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['rating'] is int) {
      rating = (json['rating'] as int).toDouble();
    } else if (json['rating'] is double) {
      rating = json['rating'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rating'] = rating;
    return data;
  }
}
