import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/config/host_config.dart';
import 'package:my_dinner/core/services/injection.dart';

@RegisterAs(HostConfig, env: Env.dev)
@singleton
class DevHostConfig extends HostConfig {
  String get baseUrl => 'http://localhost:8081';
}
