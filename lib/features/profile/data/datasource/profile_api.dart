import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/features/profile/data/dtos/client_dto.dart';

abstract class ProfileApi {
  Future<ClientDto> getProfile();

  Future<ClientDto> updateProfile(ClientDto client);
}

@singleton
@RegisterAs(ProfileApi, env: Env.dev)
class ProfileHttpApi extends ProfileApi {
  final MyHttpClient client;

  ProfileHttpApi(this.client);

  @override
  Future<ClientDto> getProfile() {
    return client.get(
      path: '/client',
      out: (value) => ClientDto.fromJson(value),
    );
  }

  @override
  Future<ClientDto> updateProfile(ClientDto clientDto) {
    return client.put(
      path: '/client',
      body: clientDto.toJson(),
      out: (value) => ClientDto.fromJson(value),
    );
  }
}

@singleton
@RegisterAs(ProfileApi, env: Env.demo)
class ProfileDemoApi extends ProfileApi {
  @override
  Future<ClientDto> getProfile() {
    throw UnimplementedError();
  }

  @override
  Future<ClientDto> updateProfile(ClientDto clientDto) {
    throw UnimplementedError();
  }
}
