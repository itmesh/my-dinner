import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/usecases/get_addresses.dart';
import 'package:my_dinner/features/address/presentation/mobx/address_store.dart';
import 'package:my_dinner/features/address/presentation/pages/address_details_page.dart';
import 'package:my_dinner/features/address/presentation/widgets/address_card.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class AddressListPage extends StatefulWidget {
  static Route<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => AddressListPage(),
    );
  }

  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  final AddressStore addressStore = AddressStore(locator.get<GetAddresses>());

  @override
  void initState() {
    addressStore.download();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MyDietPage.routeWithParams());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Moje adresy'),
        ),
        drawer: NavigationDrawer(),
        body: Observer(
          builder: (_) => Column(
            children: <Widget>[
              AnimatedOpacity(
                child: const LinearProgressIndicator(),
                duration: const Duration(milliseconds: 200),
                opacity: addressStore.loading ? 1.0 : 0.0,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => addressStore.download(),
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      ...addressStore.addresses
                          .map((e) => _mapToAddressCard(context, e))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            AddressDetailsResponse response = await Navigator.of(context)
                .push(AddressDetailsPage.routeWithParams());
            if (response != null) {
              addressStore.performOperation(
                response.address,
                response.operation,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _mapToAddressCard(BuildContext context, Address address) {
    return AddressCard(
      onTap: () async {
        AddressDetailsResponse response = await Navigator.of(context)
            .push(AddressDetailsPage.routeWithParams(address: address));
        if (response != null) {
          addressStore.performOperation(
            response.address,
            response.operation,
          );
        }
      },
      trailingIconType: TrailingIconType.arrow,
      address: address,
    );
  }
}
