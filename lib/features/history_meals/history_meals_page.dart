import 'package:flutter/material.dart';
import 'package:my_dinner/features/history_meals/meal_details_page.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class HistoryMealsPage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => HistoryMealsPage(),
    );
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
          title: Text('Historia posiłków'),
        ),
        body: ListView(
          children: <Widget>[
            ...List.generate(15, (index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MealDetailsPage.route);
                  },
                  title: Text('21.01.2020'),
                  subtitle: Text('Omlet z szynką, pieczarkami i papryką'),
                ),
              );
            }),
          ],
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }
}
