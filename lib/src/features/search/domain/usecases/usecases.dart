import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/search/data/implements/implements.dart';

import '../repositories/repositories.dart';

class GetSearchUseCase {
  final SearchRepository repository = SearchRepositoryImp();

  EitherData<List<Property>> fetchProperties() async {
    return repository.fetchProperties();
  }
}
