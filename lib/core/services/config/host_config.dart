import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/injection.dart';

abstract class HostConfig {
  String get baseUrl;
}

@RegisterAs(HostConfig, env: Env.dev)
@singleton
class DevHostConfig extends HostConfig {
  String get baseUrl => 'http://192.168.8.116:8080';
}

@RegisterAs(HostConfig, env: Env.demo)
@singleton
class DemoHostConfig extends HostConfig {
  String get baseUrl => null;
}
