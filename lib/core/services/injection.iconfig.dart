// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_dinner/core/services/auth_service.dart';
import 'package:my_dinner/core/services/config/dev_host_config.dart';
import 'package:my_dinner/core/services/config/host_config.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/core/services/date_service.dart';
import 'package:my_dinner/core/services/my_http_client.dart';
import 'package:my_dinner/core/services/utils/preferences.dart';
import 'package:my_dinner/features/address/data/datasources/address_api.dart';
import 'package:my_dinner/features/address/data/repositories/address_repository_imp.dart';
import 'package:my_dinner/features/address/domain/repositories/address_repository.dart';
import 'package:my_dinner/features/address/domain/usecases/add_address.dart';
import 'package:my_dinner/features/address/domain/usecases/delete_address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';
import 'package:my_dinner/features/address/domain/usecases/update_address.dart';
import 'package:my_dinner/features/auth/data/datasources/auth_api.dart';
import 'package:my_dinner/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:my_dinner/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_dinner/features/auth/domain/usecases/login.dart';
import 'package:my_dinner/features/auth/domain/usecases/password_forgotten.dart';
import 'package:my_dinner/features/auth/domain/usecases/register.dart';
import 'package:my_dinner/features/auth/presentation/provider/auth_provider.dart';
import 'package:my_dinner/features/auth/presentation/provider/password_forgotten_provider.dart';
import 'package:my_dinner/features/my_diet/data/datasources/my_diet_api.dart';
import 'package:my_dinner/features/my_diet/data/repository/my_diet_repository_imp.dart';
import 'package:my_dinner/features/my_diet/domain/repositories/my_diet_repository.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/get_diet.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';
import 'package:my_dinner/features/pick_diet/data/datasource/companies_api.dart';
import 'package:my_dinner/features/pick_diet/data/repository/companies_repository_imp.dart';
import 'package:my_dinner/features/pick_diet/domain/repositories/companies_repository.dart';
import 'package:my_dinner/features/pick_diet/domain/usecases/get_companies.dart';
import 'package:my_dinner/features/pick_diet/presentation/provider/diet_picker.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<DateService>(() => DateService());
  g.registerFactory<AuthProvider>(() => AuthProvider(
        g<Login>(),
        g<Register>(),
        g<Session>(),
      ));
  g.registerFactory<PasswordForgottenProvider>(() => PasswordForgottenProvider(
        g<PasswordForgotten>(),
      ));
  g.registerFactory<MyDietState>(() => InitialMyDiet());
  g.registerFactory<DietPicker>(() => DietPicker(
        g<GetCompanies>(),
      ));
  g.registerFactory<MyDietBloc>(() => MyDietBloc(
        g<MyDietState>(),
        g<GetDiet>(),
      ));

  //Eager singletons must be registered in the right order
  g.registerSingleton<AuthService>(AuthService());
  if (environment == 'dev') {
    g.registerSingleton<HostConfig>(DevHostConfig());
  }
  g.registerSingleton<Session>(Session(
    g<AuthService>(),
  ));
  if (environment == 'dev') {
    g.registerSingleton<MyHttpClient>(MyHttpClient(
      g<HostConfig>(),
    ));
  }
  g.registerSingleton<PreferencesApi>(Preferences());
  if (environment == 'demo') {
    g.registerSingleton<PreferencesApi>(PreferencesDemo());
  }
  g.registerSingleton<AddressApi>(AddressHttpApi());
  if (environment == 'demo') {
    g.registerSingleton<AddressApi>(AddressDemoApi());
  }
  g.registerSingleton<AddressRepository>(AddressRepositoryImp(
    g<AddressApi>(),
  ));
  g.registerSingleton<CreateAddress>(CreateAddress(
    g<AddressRepository>(),
  ));
  g.registerSingleton<DeleteAddress>(DeleteAddress(
    g<AddressRepository>(),
  ));
  g.registerSingleton<GetAddresses>(GetAddresses(
    g<AddressRepository>(),
  ));
  g.registerSingleton<UpdateAddress>(UpdateAddress(
    g<AddressRepository>(),
  ));
  if (environment == 'dev') {
    g.registerSingleton<AuthApi>(AuthApiHttp(
      g<MyHttpClient>(),
    ));
  }
  if (environment == 'demo') {
    g.registerSingleton<AuthApi>(AuthApiDemo());
  }
  g.registerSingleton<AuthRepository>(AuthRepositoryImp(
    g<AuthApi>(),
  ));
  g.registerSingleton<Login>(Login(
    g<AuthRepository>(),
  ));
  g.registerSingleton<PasswordForgotten>(PasswordForgotten(
    g<AuthRepository>(),
  ));
  g.registerSingleton<Register>(Register(
    authRepository: g<AuthRepository>(),
  ));
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
  g.registerSingleton<CompaniesApi>(CompaniesApiHttp());
  if (environment == 'demo') {
    g.registerSingleton<CompaniesApi>(CompaniesApiDemo());
  }
  g.registerSingleton<CompaniesRepository>(CompaniesRepositoryImp(
    g<CompaniesApi>(),
  ));
  g.registerSingleton<GetCompanies>(GetCompanies(
    g<CompaniesRepository>(),
  ));
}
