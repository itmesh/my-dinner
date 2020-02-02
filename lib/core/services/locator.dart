import 'package:get_it/get_it.dart';

import 'package:my_dinner/core/services/api.dart';
import 'package:my_dinner/core/services/demo_api.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_bloc.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';

typedef ServiceLocatorConfiguration = Function(GetIt);

GetIt sl = GetIt.I();

class Locator {
  static void config(ServiceLocatorConfiguration config) {
    sl.reset();
    config.call(sl);
  }
}

class LocatorConfigurator {
  static void config() {
    Locator.config((r) {
      _demo(r);
    });
  }

  static void _demo(GetIt r) {
    r.registerLazySingleton<Api>(() => DemoApi());
    r.registerFactory<MyDietState>(() => MyDietState());
    r.registerFactory<MyDietBloc>(() => MyDietBloc(sl.get<MyDietState>()));
  }
}
