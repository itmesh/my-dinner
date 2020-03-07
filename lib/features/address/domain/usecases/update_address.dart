import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

@singleton
class UpdateAddress extends UseCase<Address, UpdateAddressParams> {
  @override
  Future<Either<Failure, Address>> call(UpdateAddressParams params) {
    throw UnimplementedError();
  }
}

class UpdateAddressParams {
  final Address address;

  UpdateAddressParams(this.address);
}
