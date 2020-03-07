import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

@singleton
class AddAddress extends UseCase<Address, AddAddressParams> {
  @override
  Future<Either<Failure, Address>> call(AddAddressParams params) {
    throw UnimplementedError();
  }
}

class AddAddressParams {
  final Address address;

  AddAddressParams(this.address);
}
