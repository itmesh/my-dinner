import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';

@singleton
class UpdateAddress extends UseCase<Address, UpdateAddressParams> {
  final AddressRepository addressRepository;

  UpdateAddress(this.addressRepository);

  @override
  Future<Either<Failure, Address>> call(UpdateAddressParams params) async {
    return await addressRepository.updateAddress(params.address);
  }
}

class UpdateAddressParams {
  final Address address;

  UpdateAddressParams({this.address});
}
