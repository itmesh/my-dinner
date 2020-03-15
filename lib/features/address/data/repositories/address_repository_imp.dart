import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/address/data/datasources/address_api.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';

@RegisterAs(AddressRepository)
@singleton
class AddressRepositoryImp extends AddressRepository {
  final AddressApi addressApi;

  AddressRepositoryImp(this.addressApi);

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
    try {
      return Right(await addressApi.getAddresses());
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Address>> createAddress(Address address) async {
    try {
      return Right(await addressApi.createAddress(address));
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Address>> updateAddress(Address address) async {
    try {
      return Right(await addressApi.updateAddress(address));
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Address>> deleteAddress(Address address) async {
    try {
      return Right(await addressApi.deleteAddress(address));
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }
}
