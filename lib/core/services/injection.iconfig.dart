// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_dinner/core/services/date_service.dart';
import 'package:my_dinner/features/my_diet/data/datasources/my_diet_api.dart';
import 'package:my_dinner/features/my_diet/data/repository/my_diet_repository_imp.dart';
import 'package:my_dinner/features/my_diet/domain/repositories/my_diet_repository.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/get_diet.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<DateService>(() => DateService());
  g.registerFactory<MyDietState>(() => InitialMyDiet());
  g.registerFactory<MyDietBloc>(() => MyDietBloc(
        g<MyDietState>(),
        g<GetDiet>(),
      ));
  _registerEagerSingletons(g, environment);
}

// Eager singletons must be registered in the right order
void _registerEagerSingletons(GetIt g, String environment) {
  g.registerSingleton<MyDietApi>(MyDietApiHttp());
  if (environment == 'demo') {
    g.registerSingleton<MyDietApi>(MyDietApiDemo());
  }
  g.registerSingleton<MyDietRepository>(MyDietRepositoryImp(
    g<MyDietApi>(),
  ));
  g.registerSingleton<GetDiet>(GetDiet(
    g<MyDietRepository>(),
  ));
}
