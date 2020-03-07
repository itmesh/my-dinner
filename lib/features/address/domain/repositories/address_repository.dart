import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddresses();
}
