import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/address/data/datasources/address_api.dart';
import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';

@RegisterAs(AddressRepository)
@singleton
class AddressRepositoryImp extends AddressRepository {
  final _log = Log('AddressRepositoryImp');
  final AddressApi addressApi;

  AddressRepositoryImp(this.addressApi);

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
    try {
      List<AddressDto> dto = await addressApi.getAddresses();
      return Right(dto.map((e) => Address.fromDto(e)).toList());
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Address>> createAddress(Address address) async {
    try {
      AddressDto dto = await addressApi.createAddress(address.toDto());
      return Right(Address.fromDto(dto));
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Address>> updateAddress(Address address) async {
    try {
      await addressApi.updateAddress(address.toDto());
      return Right(address);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }

  @override
  Future<Either<Failure, Address>> deleteAddress(Address address) async {
    try {
      await addressApi.deleteAddress(address.toDto());
      return Right(address);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }
}
