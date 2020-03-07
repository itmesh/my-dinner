import 'package:flutter/material.dart';
import 'package:my_dinner/features/new_order/presentation/widgets/diet_form.dart';

class EditDietPage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => EditDietPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pakiet pudełek'),
        leading: CloseButton(),
      ),
      body: DietForm(),
    );
  }
}
