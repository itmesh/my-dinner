import '../../address/pages/domain/entities/address.dart';

class Diet {
  final String name;
  final int calories;
  final int dietCounts;
  final Address address;
  final String remarks;

  Diet({
    this.name,
    this.calories,
    this.dietCounts,
    this.address,
    this.remarks,
  });
}
