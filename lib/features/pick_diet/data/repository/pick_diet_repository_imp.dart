import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/log.dart';

import 'package:my_dinner/features/pick_diet/data/datasource/pick_diet_api.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/vendor_offer_dto.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/features/pick_diet/domain/repositories/pick_diet_repository.dart';

@singleton
@RegisterAs(PickDietRepository)
class PickDietRepositoryImp extends PickDietRepository {
  final _log = Log('PickDietRepositoryImp');
  final PickDietApi pickDietApi;

  PickDietRepositoryImp(this.pickDietApi);

  @override
  Future<Either<Failure, List<DietOffer>>> getOffers(int companyId) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Company>>> getVendors() async {
    try {
      List<VendorDto> offersDto = await pickDietApi.getVendors();
      return Right(offersDto.map((e) => Company.fromDto(e)).toList());
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }
}
