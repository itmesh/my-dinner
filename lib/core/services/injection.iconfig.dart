// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_dinner/core/services/auth_service.dart';
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
import 'package:my_dinner/features/pick_diet/domain/usecases/get_companies.dart';
import 'package:my_dinner/features/profile/data/datasource/profile_api.dart';
import 'package:my_dinner/features/profile/data/repository/profile_repository_imp.dart';
import 'package:my_dinner/features/profile/domain/repositories/profile_repository.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/order_diet.dart';
import 'package:my_dinner/features/pick_diet/data/datasource/pick_diet_api.dart';
import 'package:my_dinner/features/pick_diet/data/repository/pick_diet_repository_imp.dart';
import 'package:my_dinner/features/pick_diet/domain/repositories/pick_diet_repository.dart';
import 'package:my_dinner/features/pick_diet/domain/usecases/get_offers.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_bloc.dart';
import 'package:my_dinner/features/pick_diet/presentation/provider/diet_picker.dart';
import 'package:my_dinner/features/profile/domain/usecases/get_profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/update_profile.dart';
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
  g.registerFactory<MyDietBloc>(() => MyDietBloc(
        g<MyDietState>(),
        g<GetDiet>(),
        g<OrderDiet>(),
      ));
  g.registerFactory<DietPicker>(() => DietPicker(
        g<GetCompanies>(),
        g<GetOffers>(),
      ));

  //Eager singletons must be registered in the right order
  g.registerSingleton<AuthService>(AuthService());
  if (environment == 'dev') {
    g.registerSingleton<HostConfig>(DevHostConfig());
  }
  if (environment == 'demo') {
    g.registerSingleton<HostConfig>(DemoHostConfig());
  }
  g.registerSingleton<Session>(Session(
    g<AuthService>(),
  ));
  if (environment == 'dev') {
    g.registerSingleton<MyHttpClient>(MyHttpClient(
      g<HostConfig>(),
      g<Session>(),
    ));
  }
  g.registerSingleton<PreferencesApi>(Preferences());
  if (environment == 'demo') {
    g.registerSingleton<PreferencesApi>(PreferencesDemo());
  }
  if (environment == 'dev') {
    g.registerSingleton<AddressApi>(AddressHttpApi(
      g<MyHttpClient>(),
    ));
  }
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
  g.registerSingleton<GetCompanies>(GetCompanies());
  if (environment == 'dev') {
    g.registerSingleton<ProfileApi>(ProfileHttpApi(
      g<MyHttpClient>(),
    ));
  }
  if (environment == 'demo') {
    g.registerSingleton<ProfileApi>(ProfileDemoApi());
  }
  g.registerSingleton<ProfileRepository>(ProfileRepositoryImp(
    g<ProfileApi>(),
  ));
  g.registerSingleton<OrderDiet>(OrderDiet(
    g<MyDietRepository>(),
  ));
  if (environment == 'dev') {
    g.registerSingleton<PickDietApi>(PickDietHttpApi(
      g<MyHttpClient>(),
    ));
  }
  if (environment == 'demo') {
    g.registerSingleton<PickDietApi>(PickDietDemoApi());
  }
  g.registerSingleton<PickDietRepository>(PickDietRepositoryImp(
    g<PickDietApi>(),
  ));
  g.registerSingleton<GetOffers>(GetOffers(
    g<PickDietRepository>(),
  ));
  g.registerSingleton<GetProfile>(GetProfile(
    g<ProfileRepository>(),
  ));
  g.registerSingleton<UpdateProfile>(UpdateProfile(
    g<ProfileRepository>(),
  ));
}
