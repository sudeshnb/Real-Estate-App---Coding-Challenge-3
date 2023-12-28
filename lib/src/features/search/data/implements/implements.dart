import 'package:proplink/src/core/error/functions.dart';

import 'package:proplink/src/features/home/data/models/property.dart';

import '../sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class SearchRepositoryImp implements SearchRepository {
  SearchRepositoryImp();

  final SearchRemoteDataSource remoteDataSource = SearchRemoteDataSource();
  @override
  EitherData<List<Property>> fetchProperties() {
    return remoteDataSource.fetchProperties();
  }
}
