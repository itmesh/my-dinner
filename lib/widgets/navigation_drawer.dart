import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dinner/features/address/presentation/pages/address_list_page.dart';
import 'package:my_dinner/features/history_meals/history_meals_page.dart';
import 'package:my_dinner/features/history_orders/presentation/pages/orders_page.dart';
import 'package:my_dinner/features/login/login_page.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/profile/presentation/pages/profile_page.dart';

class NavigationDrawer extends StatelessWidget {
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
            ListTile(
              title: Text('Moja dieta'),
              onTap: () {
                Navigator.of(context).pushReplacement(MyDietPage.route);
              },
            ),
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
                Navigator.of(context).pushReplacement(ProfilePage.route);
              },
            ),
            ListTile(
              title: Text('Wyloguj'),
              onTap: () {
                Navigator.of(context).pushReplacement(LoginPage.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
