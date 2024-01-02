import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/profile/data/sources/profile.list.source.dart';
import 'package:proplink/src/features/profile/domain/repositories/repository.dart';

import '../models/profile.view.model.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource = ProfileRemoteDataSource();

  @override
  EitherData<ProfileListDataModel> fetchProperties() async {
    return remoteDataSource.fetchProperties();
  }
}
