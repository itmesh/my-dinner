import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/core/services/utils/api_helper.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/vendor_dto.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/vendor_offer_dto.dart';

abstract class PickDietApi {
  Future<List<VendorOfferDto>> getOffers(int vendorId);

  Future<List<VendorDto>> getVendors();
}

@singleton
@RegisterAs(PickDietApi, env: Env.dev)
class PickDietHttpApi extends PickDietApi {
  final MyHttpClient client;

  PickDietHttpApi(this.client);

  @override
  Future<List<VendorOfferDto>> getOffers(int vendorId) {
    return client.get(
      path: '/guest/offer',
      out: (value) => jsonToDtoList(value, (e) => VendorOfferDto.fromJson(e)),
    );
  }

  @override
  Future<List<VendorDto>> getVendors() {
    throw UnimplementedError();
  }
}

@singleton
@RegisterAs(PickDietApi, env: Env.demo)
class PickDietDemoApi extends PickDietApi {
  @override
  Future<List<VendorOfferDto>> getOffers(int vendorId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VendorDto>> getVendors() {
    throw UnimplementedError();
  }
}
