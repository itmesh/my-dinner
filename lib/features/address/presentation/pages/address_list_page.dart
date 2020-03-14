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
import 'package:my_dinner/features/new_order/presentation/pages/edit_address_details_page.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class AddressListPage extends StatelessWidget {
  final AddressStore addressStore = AddressStore(locator.get<GetAddresses>());

  static Route<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => AddressListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    addressStore.download();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MyDietPage.route);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Moje adresy'),
        ),
        drawer: NavigationDrawer(),
        body: Observer(
          builder: (_) => RefreshIndicator(
            onRefresh: () => addressStore.download(),
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                if (addressStore.loading) LinearProgressIndicator(),
                ...addressStore.addresses
                    .map((e) => _mapToAddressCard(context, e))
                    .toList(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(EditAddressDetailsPage.route)
                .then((address) {});
          },
        ),
      ),
    );
  }

  Widget _mapToAddressCard(BuildContext context, Address address) {
    return AddressCard(
      onTap: () {
        Navigator.of(context).push(AddressDetailsPage.routeWithParams(
          address: address,
          canDelete: true,
        ));
      },
      trailingIconType: TrailingIconType.arrow,
      address: address,
    );
  }
}
