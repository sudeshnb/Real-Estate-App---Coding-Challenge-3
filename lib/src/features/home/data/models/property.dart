// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PropertyModel {
  final List<Property> property;

  PropertyModel({required this.property});

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      property: List<Property>.from(
        (map['property'] as List<dynamic>).map<Property>(
          (x) => Property.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory PropertyModel.fromJson(String source) =>
      PropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Property {
  String? id;
  String? area;
  String? address;
  String? city;
  String? image;
  String? panaroma;
  String? propertyType;
  String? discountTitle;
  String? discountDescription;
  int? floorspace;
  String? latitude;
  String? listingName;
  String? longitude;
  double? lotSizeValue;
  String? overView;
  String? lotSizeUnit;
  List<Brokers>? brokers;
  double? reviewCount;
  List<Reviews>? reviews;
  int? numBedroom;
  int? numBathroom;
  List<Prices>? prices;
  int? parking;
  List<PropertyTaxes>? propertyTaxes;
  List<String>? images;
  List<String>? facilities;

  Property({
    this.id,
    this.area,
    this.address,
    this.city,
    this.image,
    this.panaroma,
    this.propertyType,
    this.floorspace,
    this.latitude,
    this.listingName,
    this.longitude,
    this.lotSizeValue,
    this.overView,
    this.lotSizeUnit,
    this.brokers,
    this.reviewCount,
    this.reviews,
    this.numBedroom,
    this.numBathroom,
    this.prices,
    this.parking,
    this.propertyTaxes,
    this.images,
    this.facilities,
    this.discountDescription,
    this.discountTitle,
  });

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'];
    address = json['address'];
    city = json['city'];
    image = json['image'];
    panaroma = json['panaroma'];
    propertyType = json['propertyType'];
    floorspace = json['floorspace'];
    latitude = json['latitude'];

    discountDescription = json['discountDescription'];
    discountTitle = json['discountTitle'];

    listingName = json['listingName'];
    longitude = json['longitude'];
    lotSizeValue = json['lotSizeValue'];
    overView = json['overView'];
    lotSizeUnit = json['lotSizeUnit'];
    if (json['brokers'] != null) {
      brokers = <Brokers>[];
      json['brokers'].forEach((v) {
        brokers!.add(Brokers.fromJson(v));
      });
    }
    reviewCount = json['reviewCount'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    numBedroom = json['numBedroom'];
    numBathroom = json['numBathroom'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    parking = json['parking'];
    if (json['propertyTaxes'] != null) {
      propertyTaxes = <PropertyTaxes>[];
      json['propertyTaxes'].forEach((v) {
        propertyTaxes!.add(PropertyTaxes.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
    facilities = json['facilities'].cast<String>();
  }
}

class Brokers {
  String? agent;
  String? image;
  String? company;
  String? phone;
  String? email;

  Brokers({this.agent, this.image, this.company, this.phone, this.email});

  Brokers.fromJson(Map<String, dynamic> json) {
    agent = json['agent'];
    image = json['image'];
    company = json['company'];
    phone = json['phone'];
    email = json['email'];
  }
}

class Reviews {
  String? userImage;
  String? userName;
  String? description;
  String? createAt;
  double? review;

  Reviews(
      {this.userImage,
      this.userName,
      this.description,
      this.createAt,
      this.review});

  Reviews.fromJson(Map<String, dynamic> json) {
    userImage = json['userImage'];
    userName = json['userName'];
    description = json['description'];
    createAt = json['createAt'];
    review = json['review'];
  }
}

class Prices {
  int? amountMax;
  int? amountMin;
  String? currency;
  List<String>? dateSeen;
  String? isSale;

  Prices(
      {this.amountMax,
      this.amountMin,
      this.currency,
      this.dateSeen,
      this.isSale});

  Prices.fromJson(Map<String, dynamic> json) {
    amountMax = json['amountMax'];
    amountMin = json['amountMin'];
    currency = json['currency'];
    dateSeen = json['dateSeen'].cast<String>();
    isSale = json['isSale'];
  }
}

class PropertyTaxes {
  int? amount;
  String? currency;
  List<String>? dateSeen;

  PropertyTaxes({this.amount, this.currency, this.dateSeen});

  PropertyTaxes.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    dateSeen = json['dateSeen'].cast<String>();
  }
}
