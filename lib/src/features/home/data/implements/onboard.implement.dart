import 'package:proplink/src/features/home/data/models/onboard.models.dart';
import 'package:proplink/src/features/home/domain/repositories/onboard.repositories.dart';

import '../sources/onboard.source.dart';

class OnBoardRepositoryImpl implements OnBoardRepository {
  @override
  List<OnBoardModel> getOnBoardData() {
    try {
      return onBoardData;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
