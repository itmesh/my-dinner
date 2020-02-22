abstract class MyDietEvent {
  MyDietEvent();
}

class LoadMyDiet extends MyDietEvent {
  final DateTime selectedDay;

  LoadMyDiet(this.selectedDay);
}
