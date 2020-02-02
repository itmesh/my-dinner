abstract class DeliveryHours {}

class RangeDeliveryHours extends DeliveryHours {
  final DateTime fromHour;
  final DateTime toHour;

  RangeDeliveryHours(this.fromHour, this.toHour);
}

class BeforeDeliveryHours extends DeliveryHours {
  final DateTime beforeHour;

  BeforeDeliveryHours(this.beforeHour);
}

class FakeDeliveryHours extends DeliveryHours {
  @override
  String toString() => '8:00 - 10:00';
}
