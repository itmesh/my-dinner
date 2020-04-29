import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/features/pick_diet/domain/repositories/pick_diet_repository.dart';

@singleton
class GetOffers extends UseCase<List<DietOffer>, GetOfferParams> {
  final PickDietRepository pickDietRepository;

  GetOffers(this.pickDietRepository);

  @override
  Future<Either<Failure, List<DietOffer>>> call(GetOfferParams params) {
    return pickDietRepository.getOffers(params.companyId);
  }
}

class GetOfferParams {
  final int companyId;

  GetOfferParams({this.companyId});
}
