import 'package:flutter/material.dart';
import 'package:my_dinner/features/my_diet/domain/models/meal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MealPage extends StatelessWidget {
  const MealPage({Key key, this.meal}) : super(key: key);

  static ModalRoute<dynamic> routeWithParams(Meal meal) {
    return MaterialPageRoute(
      builder: (_) => MealPage(
        meal: meal,
      ),
    );
  }

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          title: Text(meal.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(meal.description),
                SizedBox(height: 8.0),
                Text('Białko: '),
                SizedBox(height: 8.0),
                Text('Węglowodany: '),
                SizedBox(height: 8.0),
                Text('Tłuszcze: '),
                SizedBox(height: 8.0),
                Text('Kalorie: 3123 kcal'),
                SizedBox(height: 8.0),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RatingBar(
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Posiłek możesz ocenić dopiero w dniu dostawy. Będziesz miał na to 3 dni.',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Ilość kalorii: ${meal.diet.calories}'),
                SizedBox(height: 8.0),
                Text('Nazwa diety: ${meal.diet.name}'),
              ],
            ),
          ),
        ));
  }
}
