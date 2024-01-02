import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/profile/data/implements/implements.dart';
import 'package:proplink/src/features/profile/data/models/profile.view.model.dart';
import 'package:proplink/src/features/profile/domain/repositories/repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository = ProfileRepositoryImp();

  EitherData<ProfileListDataModel> fetchProperties() async {
    return repository.fetchProperties();
  }
}
