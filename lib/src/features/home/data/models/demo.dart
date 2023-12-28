import 'dart:convert';
import 'property.dart';

class DemoDataModel {
  final List<CategoryModel> categories;
  final List<DiscountModel> discounts;
  final List<LocationModel> locations;
  final List<AgentModel> argents;
  final List<Property> nearby;
  final List<Property> features;

  DemoDataModel({
    required this.categories,
    required this.discounts,
    required this.locations,
    required this.argents,
    required this.nearby,
    required this.features,
  });

  factory DemoDataModel.fromMap(Map<String, dynamic> map) {
    return DemoDataModel(
      categories: List<CategoryModel>.from(
        (map['categories'] as List<dynamic>).map<CategoryModel>(
          (x) => CategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      discounts: List<DiscountModel>.from(
        (map['discounts'] as List<dynamic>).map<DiscountModel>(
          (x) => DiscountModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      locations: List<LocationModel>.from(
        (map['locations'] as List<dynamic>).map<LocationModel>(
          (x) => LocationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      argents: List<AgentModel>.from(
        (map['argents'] as List<dynamic>).map<AgentModel>(
          (x) => AgentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      nearby: List<Property>.from(
        (map['nearby'] as List<dynamic>).map<Property>(
          (x) => Property.fromJson(x as Map<String, dynamic>),
        ),
      ),
      features: List<Property>.from(
        (map['features'] as List<dynamic>).map<Property>(
          (x) => Property.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory DemoDataModel.fromJson(String source) =>
      DemoDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

///
///
///

class CategoryModel {
  final int id;
  final String name;
  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

///
///
///

class DiscountModel {
  final String title;
  final String image;
  final String offer;
  final Property property;

  DiscountModel({
    required this.image,
    required this.offer,
    required this.title,
    required this.property,
  });

  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      title: map['title'] as String,
      image: map['image'] as String,
      offer: map['offer'] as String,
      property: Property.fromJson(map['property'] as Map<String, dynamic>),
    );
  }

  factory DiscountModel.fromJson(String source) =>
      DiscountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

///
///
///

class LocationModel {
  final int id;
  final String name;
  final String image;

  LocationModel({required this.id, required this.name, required this.image});

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

///
///
///

class AgentModel {
  final int id;
  final String name;
  final String image;

  AgentModel({required this.id, required this.name, required this.image});

  factory AgentModel.fromMap(Map<String, dynamic> map) {
    return AgentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  factory AgentModel.fromJson(String source) =>
      AgentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

///
///