import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';

@singleton
class CreateAddress extends UseCase<Address, AddAddressParams> {

  final AddressRepository addressRepository;

  CreateAddress(this.addressRepository);

  @override
  Future<Either<Failure, Address>> call(AddAddressParams params) async {
    return await addressRepository.createAddress(params.address);
  }
}

class AddAddressParams {
  final Address address;

  AddAddressParams({this.address});
}
