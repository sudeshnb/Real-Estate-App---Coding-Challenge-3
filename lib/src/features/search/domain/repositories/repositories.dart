import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

abstract class SearchRepository {
  EitherData<List<Property>> fetchProperties();
}
