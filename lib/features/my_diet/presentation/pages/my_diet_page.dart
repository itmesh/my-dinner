import 'package:flutter/material.dart';
import 'package:my_dinner/features/history_orders/domain/diet.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/meal_page.dart';
import 'package:my_dinner/features/new_order/pages/edit_address_details_page.dart';
import 'package:my_dinner/features/new_order/pages/new_order_page.dart';
import 'package:my_dinner/model/meal.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class MyDietPage extends StatelessWidget {
  final _calendarController = CalendarController();

  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => MyDietPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moja dieta'),
      ),
      body: Column(
        children: <Widget>[
          Calendar(
            calendarController: _calendarController,
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, position) => ListView(
                children: <Widget>[
                  ...meals
                      .map((meal) => Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MealPage.routeWithParams(meal));
                              },
                              title: Text(meal.name),
                              subtitle: Text(
                                'Kasza z marynowanym kurczakiem w sosie własnym',
                              ),
                            ),
                          ))
                      .toList(),
                  SizedBox(height: 32.0),
                ],
              ),
              onPageChanged: (position) {
                _calendarController.setSelectedDay(
                  _calendarController.selectedDay.add(Duration(days: 2)),
                  isProgrammatic: false,
                );
              },
            ),
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(NewOrderPage.route);
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text('Zmień adress'),
                onPressed: () {
                  Navigator.of(context).push(EditAddressDetailsPage.route);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text('Usuń diete'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  static List<Meal> meals = [
    Meal(
      name: 'Śniadanie',
      description: 'Kasza z marynowanym kurczakiem w sosie własnym',
      diet: Diet(calories: 3000, name: 'Dieta sportowa 3000 kalorii'),
    ),
    Meal(
      name: 'Drugie śniadanie',
      description: 'Kasza z marynowanym kurczakiem w sosie własnym',
      diet: Diet(calories: 3000, name: 'Dieta sportowa 3000 kalorii'),
    ),
    Meal(
      name: 'Obiad',
      description: 'Kasza z marynowanym kurczakiem w sosie własnym',
      diet: Diet(calories: 3000, name: 'Dieta sportowa 3000 kalorii'),
    ),
    Meal(
      name: 'Podwieczorek',
      description: 'Kasza z marynowanym kurczakiem w sosie własnym',
      diet: Diet(calories: 3000, name: 'Dieta sportowa 3000 kalorii'),
    ),
    Meal(
      name: 'Kolacja',
      description: 'Kasza z marynowanym kurczakiem w sosie własnym',
      diet: Diet(calories: 3000, name: 'Dieta sportowa 3000 kalorii'),
    ),
    Meal(
      name: 'Dodatkowy posiłek nr. 1',
      description: 'Kasza z marynowanym kurczakiem w sosie własnym',
      diet: Diet(calories: 3000, name: 'Dieta sportowa 3000 kalorii'),
    ),
  ];
}

class Calendar extends StatefulWidget {
  final CalendarController calendarController;

  const Calendar({Key key, this.calendarController}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  AnimationController _animationController;
  List<DateTime> _selectedDays = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      events: {
        DateTime.now(): ['event 1'],
      },
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.week: 'Week',
      },
      key: GlobalKey(),
      calendarController: widget.calendarController,
      locale: 'pl_PL',
      initialCalendarFormat: CalendarFormat.week,
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Colors.blueAccent,
              ),
              margin: const EdgeInsets.all(2.0),
              child: Center(
                child: Text(
                  '${date.day}',
                  style:
                      TextStyle().copyWith(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.orangeAccent[100],
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
      ),
      onDaySelected: (DateTime date, _) => _onDaySelected(date),
    );
  }

  void _onDaySelected(DateTime date) {
    widget.calendarController.setCalendarFormat(CalendarFormat.week);
    _animationController.forward();
    /*
    setState(() {
      if (_selectedDays.contains(date)) {
        _selectedDays.remove(date);
      } else {
        _selectedDays.add(date);
      }
    });*/
  }
}
