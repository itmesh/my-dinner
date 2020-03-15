import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddresses();

  Future<Either<Failure, Address>> createAddress(Address address);

  Future<Either<Failure, Address>> updateAddress(Address address);

  Future<Either<Failure, Address>> deleteAddress(Address address);
}
