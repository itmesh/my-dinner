import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dinner/core/services/context.dart';
import 'package:my_dinner/core/services/injection.dart';

import 'package:my_dinner/features/address/presentation/pages/address_list_page.dart';
import 'package:my_dinner/features/auth/presentation/pages/auth_page.dart';
import 'package:my_dinner/features/history_meals/history_meals_page.dart';
import 'package:my_dinner/features/history_orders/presentation/pages/orders_page.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/pick_diet/presentation/pages/diet_selector_page.dart';
import 'package:my_dinner/features/profile/presentation/pages/profile_page.dart';

class NavigationDrawer extends StatelessWidget {
  final Session session = locator.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: SvgPicture.asset('assets/images/logo-white.svg',
                    color: Colors.white, semanticsLabel: 'Acme Logo'),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            if (!session.isLogged())
              ListTile(
                title: Text('Oferta'),
                onTap: () {
                  Navigator.of(context).pushReplacement(PickDietPage.route());
                },
              ),
            if (session.isLogged())
              ListTile(
                title: Text('Moja dieta'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MyDietPage.routeWithParams());
                },
              ),
            if (session.isLogged()) ...[
              ListTile(
                title: Text('Zamówienia'),
                onTap: () {
                  Navigator.of(context).pushReplacement(OrdersPage.route);
                },
              ),
              ListTile(
                title: Text('Historia posiłków'),
                onTap: () {
                  Navigator.of(context).pushReplacement(HistoryMealsPage.route);
                },
              ),
              ListTile(
                title: Text('Adresy dostawy'),
                onTap: () {
                  Navigator.of(context).pushReplacement(AddressListPage.route);
                },
              ),
              ListTile(
                title: Text('Dane kontaktowe'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    ProfilePage.routeWithRequest(ProfilePageRequest()),
                  );
                },
              ),
            ],
            _loginOrLogout(context),
          ],
        ),
      ),
    );
  }

  Widget _loginOrLogout(BuildContext context) {
    if (session.isLogged()) {
      return ListTile(
        title: Text('Wyloguj'),
        onTap: () {
          session.logout();
          Navigator.of(context).pushReplacement(AuthPage.route);
        },
      );
    } else {
      return ListTile(
        title: Text('Zaloguj'),
        onTap: () {
          Navigator.of(context).pushReplacement(AuthPage.route);
        },
      );
    }
  }
}
