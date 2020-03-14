import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';

@singleton
class DeleteAddress extends UseCase<Address, DeleteAddressParams> {
  final AddressRepository addressRepository;

  DeleteAddress(this.addressRepository);

  @override
  Future<Either<Failure, Address>> call(DeleteAddressParams params) {
    return addressRepository.deleteAddress(params.address);
  }
}

class DeleteAddressParams {
  final Address address;

  DeleteAddressParams({this.address});
}
