import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/core/error/network.dart';
// import 'package:http/http.dart' as http;
import '../models/demo.dart';

class PropertyRemoteDataSource {
  // Make API call to fetch data and return object.
  EitherData<DemoDataModel> fetchProperties() async {
    try {
      if (await NetworkInfo.isConnected) {
        // Uri uri = Uri.https('real-estate-6s61.onrender.com', '/proplink');
        // final response = await http.get(
        //   uri,
        //   headers: <String, String>{'accept': "application/json"},
        // );
        final String response =
            await rootBundle.loadString('assets/json/all.json');

        return Left(DemoDataModel.fromJson(response));
      }
      return const Right('Please check your internet connection and try.');
    } catch (e) {
      log('message: $e');
      return const Right('Somethings went wrong.');
    }
  }
}
