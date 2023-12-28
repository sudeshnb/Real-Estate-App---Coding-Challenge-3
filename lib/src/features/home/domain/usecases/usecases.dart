import 'package:proplink/src/core/error/functions.dart';
import 'package:proplink/src/features/home/data/implements/property.implements.dart';
import '../../data/models/demo.dart';
import '../repositories/property.repository.dart';

class GetPropertyUseCase {
  final PropertyRepository repository = PropertyRepositoryImp();

  EitherData<DemoDataModel> fetchProperties() async {
    return repository.fetchProperties();
  }
}
