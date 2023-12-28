import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/home/data/models/demo.dart';
import 'package:proplink/src/features/home/domain/repositories/property.repository.dart';

import '../sources/property.sources.dart';

class PropertyRepositoryImp implements PropertyRepository {
  final PropertyRemoteDataSource remoteDataSource = PropertyRemoteDataSource();

  @override
  EitherData<DemoDataModel> fetchProperties() async {
    return remoteDataSource.fetchProperties();
  }
}
