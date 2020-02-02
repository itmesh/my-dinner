import 'package:flutter/material.dart';
import 'package:my_dinner/features/profile/presentation/widgets/profile_form.dart';

class EditProfilePage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => EditProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Dane kontaktowe'),
      ),
      body: ProfileForm(),
    );
  }
}
