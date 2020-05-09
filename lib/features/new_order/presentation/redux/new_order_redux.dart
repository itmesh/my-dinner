import 'dart:async';

import 'package:either_option/either_option.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';
import 'package:my_dinner/features/new_order/domain/usecases/create_order.dart';
import 'package:my_dinner/features/new_order/presentation/redux/address_actions.dart';
import 'package:my_dinner/features/pick_diet/domain/models/picked_diet.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/get_profile.dart';

class NewOrderState {
  Profile profile;
  List<Address> addresses;
  PickedDiet pickedDiet;
  Address selectedAddress;
  Completer completer;

  NewOrderState({
    this.profile,
    this.addresses,
    this.pickedDiet,
    this.selectedAddress,
    this.completer,
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
    pickedDiet: pickedDietReducer(state.pickedDiet, action),
    selectedAddress: state.selectedAddress,
    completer: state.completer,
  );
}

final pickedDietReducer = combineReducers<PickedDiet>([
  TypedReducer<PickedDiet, AddPickedDiet>(_addPickedDiet),
]);

PickedDiet _addPickedDiet(PickedDiet pickedDiet, AddPickedDiet action) {
  return action.pickedDiet;
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
  GetProfile getProfile = locator.get();
  Either either = await getProfile(NoParams());
  Profile profile = either.fold(
    (error) => Profile(),
    (profile) => profile,
  );
  store.dispatch(EditProfile(profile));
};

Profile _editProfile(Profile profile, EditProfile editProfile) {
  return editProfile.profile;
}

ThunkAction<NewOrderState> getAddresses = (Store<NewOrderState> store) async {
  GetAddresses getAddresses = locator.get();
  Either either = await getAddresses(NoParams());
  List<Address> addresses = either.fold(
    (error) => [],
    (addresses) => addresses,
  );
  store.dispatch(PutAddresses(addresses));
};

ThunkAction<NewOrderState> createOrder = (Store<NewOrderState> store) async {
  CreateOrder createOrder = locator.get();
  NewOrderState state = store.state;
  Either either = await createOrder(CreateOrderParams(
    address: state.addresses[0],
    calorie: state.pickedDiet.calorie,
    remarks: state.pickedDiet.remarks,
    dietCount: state.pickedDiet.setsCount,
  ));
  bool success = either.fold((_) => false, (_) => true);
  state.completer.complete();
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

class PickedDietViewModel {
  final bool isPicked;
  final String companyName;
  final String dietName;
  final String calorie;
  final String setsCount;
  final String remarks;
  final Function(PickedDiet pickedDiet) onEdit;

  PickedDietViewModel({
    this.isPicked,
    this.companyName,
    this.dietName,
    this.calorie,
    this.setsCount,
    this.remarks,
    this.onEdit,
  });

  static PickedDietViewModel fromStore(Store<NewOrderState> store) {
    PickedDiet pickedDiet = store.state.pickedDiet;
    return PickedDietViewModel(
      isPicked: pickedDiet != null,
      companyName: pickedDiet?.company?.name ?? '',
      dietName: pickedDiet?.dietOffer?.name ?? '',
      calorie: pickedDiet?.calorie?.value?.toString() ?? '0',
      setsCount: pickedDiet?.setsCount?.toString() ?? '0',
      remarks: pickedDiet?.remarks ?? '',
      onEdit: (pickedDiet) => store.dispatch(AddPickedDiet(pickedDiet)),
    );
  }
}
