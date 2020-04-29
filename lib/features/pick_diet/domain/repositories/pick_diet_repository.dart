import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';

abstract class PickDietRepository {
  Future<Either<Failure, List<DietOffer>>> getOffers(int companyId);
}
