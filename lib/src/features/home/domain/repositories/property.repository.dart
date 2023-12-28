import 'package:proplink/src/core/error/functions.dart';

import '../../data/models/demo.dart';

abstract class PropertyRepository {
  EitherData<DemoDataModel> fetchProperties();
}
