abstract class MyDietEvent {
  MyDietEvent();
}

class LoadMyDiet extends MyDietEvent {
  final DateTime selectedDay;

  LoadMyDiet(this.selectedDay);
}

class OrderMyDiet extends MyDietEvent {
  final DateTime selectedDay;

  OrderMyDiet(this.selectedDay);
}
