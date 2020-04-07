import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/data/datasources/address_api.dart';
import 'package:my_dinner/features/address/data/repositories/address_repository_imp.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';
import 'package:my_dinner/features/new_order/presentation/redux/address_actions.dart';
import 'package:my_dinner/features/pick_diet/domain/models/picked_diet.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class NewOrderState {
  Profile profile;
  List<Address> addresses;
  PickedDiet pickedDiet;
  Address selectedAddress;

  NewOrderState({
    this.profile,
    this.addresses,
    this.pickedDiet,
    this.selectedAddress,
  });

  NewOrderState.fromState(NewOrderState another) {
    profile = another.profile;
    addresses = another.addresses;
    pickedDiet = another.pickedDiet;
  }
}

class AddPickedDiet {
  final PickedDiet pickedDiet;

  AddPickedDiet(this.pickedDiet);
}

NewOrderState newOrderReducer(NewOrderState state, dynamic action) {
  return NewOrderState(
    profile: profileReducer(state.profile, action),
    addresses: addressesReducer(state.addresses, action),
  );
}

final addressesReducer = combineReducers<List<Address>>([
  TypedReducer<List<Address>, AddAddress>(_addAddress),
  TypedReducer<List<Address>, PutAddresses>(_putAddressed),
]);

List<Address> _putAddressed(List<Address> addresses, PutAddresses action) {
  return action.addresses;
}

final profileReducer = combineReducers<Profile>([
  TypedReducer<Profile, EditProfile>(_editProfile),
]);

List<Address> _addAddress(List<Address> addresses, AddAddress action) {
  return addresses..add(action.address);
}

class EditProfile {
  final Profile profile;

  EditProfile(this.profile);
}

ThunkAction<NewOrderState> getProfile = (Store<NewOrderState> store) async {
  await Future.delayed(Duration(seconds: 2));
  Profile profile = Profile(
    name: 'Krzysztof',
    surname: 'Wizner',
    email: 'krzysztofwiz93@gmail.com',
    phoneNumber: 518990713,
  );
  store.dispatch(EditProfile(profile));
};

Profile _editProfile(Profile profile, EditProfile editProfile) {
  return editProfile.profile;
}

ThunkAction<NewOrderState> getAddresses = (Store<NewOrderState> state) async {
  Either either = await GetAddresses(AddressRepositoryImp(AddressDemoApi()))
      .call(NoParams());
  List<Address> addresses = either.fold(
    (error) => [],
    (addresses) => addresses,
  );
  state.dispatch(PutAddresses(addresses));
};

class AddressViewModel {
  final String street;
  final String homeFlatNumber;
  final String postalCode;
  final String city;
  final String deliveryHours;
  final String remarks;
  final Address address;

  AddressViewModel({
    this.street,
    this.homeFlatNumber,
    this.postalCode,
    this.city,
    this.deliveryHours,
    this.remarks,
    this.address,
  });

  static AddressViewModel fromAddress(Address address) {
    if (address != null) {
      return AddressViewModel(
        street: address.street ?? '',
        homeFlatNumber: address.homeFlatNumber ?? '',
        postalCode: address.postalCode ?? '',
        city: address.city ?? '',
        deliveryHours: address.deliveryHours?.toString() ?? '',
        remarks: address.remarks ?? '',
        address: address,
      );
    }

    return null;
  }
}

class ProfileViewModel {
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;
  final Function(Profile profile) onEdit;

  ProfileViewModel({
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.onEdit,
  });

  static ProfileViewModel fromStore(Store<NewOrderState> store) {
    Profile profile = store.state.profile;
    if (profile != null) {
      return ProfileViewModel(
        name: profile.name ?? '',
        surname: profile.surname ?? '',
        email: profile.email ?? '',
        phoneNumber: profile.phoneNumber?.toString() ?? '',
        onEdit: (profile) => store.dispatch(EditProfile(profile)),
      );
    }

    return null;
  }
}
