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
          onPressed: () {
            Navigator.of(context).push(AddressDetailsPage.routeWithParams());
          },
        ),
      ),
    );
  }

  Widget _mapToAddressCard(BuildContext context, Address address) {
    return AddressCard(
      onTap: () {
        Navigator.of(context)
            .push(AddressDetailsPage.routeWithParams(address: address));
      },
      trailingIconType: TrailingIconType.arrow,
      address: address,
    );
  }
}
