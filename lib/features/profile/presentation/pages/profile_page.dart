import 'package:flutter/material.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/profile/presentation/widgets/profile_form.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class ProfilePage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MyDietPage.route);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Moje dane'),
        ),
        body: ProfileForm(),
        drawer: NavigationDrawer(),
      ),
    );
  }
}
