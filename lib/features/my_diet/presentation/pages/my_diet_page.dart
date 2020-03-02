import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dinner/core/services/date_service.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/companies/presentation/pages/companies.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_bloc.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_event.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/meal_page.dart';
import 'package:my_dinner/features/new_order/pages/edit_address_details_page.dart';
import 'package:my_dinner/features/new_order/pages/new_order_page.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class MyDietPage extends StatefulWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => MyDietPage(),
    );
  }

  @override
  _MyDietPageState createState() => _MyDietPageState();
}

class _MyDietPageState extends State<MyDietPage> {
  final CalendarController _calendarController = CalendarController();
  final MyDietBloc _bloc = locator.get();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadMyDiet(locator.get<DateService>().getCurrentDate()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moja dieta'),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Calendar(
                calendarController: _calendarController,
                onDaySelected: () =>
                    _bloc.add(LoadMyDiet(_calendarController.selectedDay)),
              ),
              _mapStateToWidget(state),
            ],
          );
        },
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

  Widget _mapStateToWidget(MyDietState state) {
    if (state is InitialMyDiet) {
      return _initialState();
    } else if (state is LoadingMyDiet) {
      return _loadingState();
    } else if (state is LoadedMyDiet) {
      return _loadedState(state);
    } else if (state is Error) {
      return _errorState();
    } else if (state is EmptyMyDiet) {
      return _emptyMyDiet();
    }

    throw UnimplementedError();
  }

  Widget _initialState() {
    return SizedBox();
  }

  Widget _emptyMyDiet() {
    return Expanded(
      child: PageView.builder(
        itemCount: 3,
        controller: PageController(initialPage: 1),
        onPageChanged: (index) {
          print(index);
          _calendarController.setSelectedDay(
            _calendarController.selectedDay.add(
              Duration(days: index - 1),
            ),
            runCallback: true,
          );
        },
        itemBuilder: (_, index) {
          if (index != 1) return SizedBox();
          return Center(
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(Companies.route);
                },
                child: SizedBox(
                  height: 150,
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Złóż zamówienie',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              size: 48.0,
                              color:
                                  IconTheme.of(context).color.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _loadedState(LoadedMyDiet state) {
    return Expanded(
      child: PageView.builder(
        controller: PageController(
          initialPage: 1,
        ),
        itemCount: 3,
        itemBuilder: (context, position) {
          if (position != 1) return SizedBox();
          return ListView(
            children: <Widget>[
              ...state.diets[0].meals
                  .map((meal) => Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .push(MealPage.routeWithParams(meal));
                          },
                          title: Text(meal.name),
                          subtitle: Text(meal.description),
                        ),
                      ))
                  .toList(),
              SizedBox(height: 32.0),
            ],
          );
        },
        onPageChanged: (index) {
          print(index);
          _calendarController.setSelectedDay(
            _calendarController.selectedDay.add(
              Duration(days: index - 1),
            ),
            runCallback: true,
          );
        },
      ),
    );
  }

  Widget _loadingState() {
    return LinearProgressIndicator();
  }

  Widget _errorState() {
    return Expanded(
      child: Center(
        child: Text(
          'Błąd sieci',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  final CalendarController calendarController;
  final VoidCallback onDaySelected;

  const Calendar({
    Key key,
    this.calendarController,
    this.onDaySelected,
  }) : super(key: key);

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
      initialSelectedDay: widget.calendarController.selectedDay,
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
    if (widget.onDaySelected != null) {
      widget.onDaySelected();
    }
  }
}
