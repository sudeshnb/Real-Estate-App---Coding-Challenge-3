import 'src/core/config/config.dart';
import 'package:flutter/material.dart';
import 'proplink.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection
  await ServiceInjection.init();

  //  This is the main app
  runApp(const RootApp());
}
