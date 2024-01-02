import 'dart:convert';

import '../../../home/data/models/property.dart';

class ProfileListDataModel {
  final List<Property> transaction;
  final List<Property> listings;
  final List<Property> sold;

  ProfileListDataModel({
    required this.listings,
    required this.transaction,
    required this.sold,
  });

  factory ProfileListDataModel.fromMap(Map<String, dynamic> map) {
    return ProfileListDataModel(
      transaction: List<Property>.from(
        (map['transaction'] as List<dynamic>).map<Property>(
          (x) => Property.fromJson(x as Map<String, dynamic>),
        ),
      ),
      sold: List<Property>.from(
        (map['sold'] as List<dynamic>).map<Property>(
          (x) => Property.fromJson(x as Map<String, dynamic>),
        ),
      ),
      listings: List<Property>.from(
        (map['listings'] as List<dynamic>).map<Property>(
          (x) => Property.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ProfileListDataModel.fromJson(String source) =>
      ProfileListDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
