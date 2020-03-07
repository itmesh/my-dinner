import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';

@singleton
class GetAddresses extends UseCase<List<Address>, NoParams> {
  final AddressRepository addressRepository;

  GetAddresses(this.addressRepository);

  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) {
    return addressRepository.getAddresses();
  }
}
