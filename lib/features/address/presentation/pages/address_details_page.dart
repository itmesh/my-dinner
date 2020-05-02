import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/add_address.dart';
import 'package:my_dinner/features/address/domain/usecases/delete_address.dart';
import 'package:my_dinner/features/address/domain/usecases/update_address.dart';
import 'package:my_dinner/features/address/presentation/mobx/address_details_store.dart';
import 'package:my_dinner/features/address/presentation/widgets/address_form.dart';

class AddressDetailsPage extends StatefulWidget {
  final Address address;

  const AddressDetailsPage({
    Key key,
    this.address,
  }) : super(key: key);

  static ModalRoute<AddressDetailsResponse> routeWithParams({Address address}) {
    return MaterialPageRoute(
      builder: (_) => AddressDetailsPage(
        address: address,
      ),
    );
  }

  @override
  _AddressDetailsPageState createState() => _AddressDetailsPageState();
}

class _AddressDetailsPageState extends State<AddressDetailsPage> {
  AddressDetailsStore _addressDetailsStore;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _addressDetailsStore = AddressDetailsStore(
      locator.get<UpdateAddress>(),
      locator.get<CreateAddress>(),
      locator.get<DeleteAddress>(),
    );
    _disposers = [
      when(
        (_) => _addressDetailsStore.addressUpdated != null,
        () => Navigator.of(context).pop(
          AddressDetailsResponse(
            address: _addressDetailsStore.addressUpdated,
            operation: Operation.update,
          ),
        ),
      ),
      when(
        (_) => _addressDetailsStore.addressDeleted != null,
        () => Navigator.of(context).pop(
          AddressDetailsResponse(
            address: _addressDetailsStore.addressDeleted,
            operation: Operation.delete,
          ),
        ),
      ),
      when(
        (_) => _addressDetailsStore.addressCreated != null,
        () => Navigator.of(context).pop(
          AddressDetailsResponse(
            address: _addressDetailsStore.addressCreated,
            operation: Operation.create,
          ),
        ),
      ),
    ];
  }

  @override
  void dispose() {
    for (final d in _disposers) d();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edytuj adres'),
        leading: CloseButton(),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) => AnimatedOpacity(
              child: const LinearProgressIndicator(),
              duration: const Duration(milliseconds: 200),
              opacity: _addressDetailsStore.loading ? 1.0 : 0.0,
            ),
          ),
          Expanded(
            child: AddressForm(
              address: widget.address,
              onCancel: () => Navigator.pop(context),
              onDelete: (address) => _addressDetailsStore.delete(address),
              onUpdate: (address) => _addressDetailsStore.update(address),
              onCreate: (address) => _addressDetailsStore.create(address),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressDetailsResponse {
  final Address address;
  final Operation operation;

  AddressDetailsResponse({this.address, this.operation});
}

enum Operation {
  create,
  update,
  delete,
}

class AddressDetailsRequest {

}
