import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/profile/data/models/profile.view.model.dart';

abstract class ProfileRepository {
  EitherData<ProfileListDataModel> fetchProperties();
}
