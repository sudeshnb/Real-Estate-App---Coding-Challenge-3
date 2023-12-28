import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/core/error/network.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class SearchRemoteDataSource {
  // Make API call to fetch data and return object.
  EitherData<List<Property>> fetchProperties() async {
    try {
      if (await NetworkInfo.isConnected) {
        final String response =
            await rootBundle.loadString('assets/json/db.json');

        return Left(PropertyModel.fromJson(response).property);
      }
      return const Right('Please check your internet connection and try.');
    } catch (e) {
      return const Right('Somethings went wrong.');
    }
  }
}
