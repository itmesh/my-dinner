class PickedDiet {
  final String companyId;
  final String dietId;
  final int calories;
  final String remark;
  final int setsCount;
  final List<DateTime> selectedDays;

  PickedDiet({
    this.companyId,
    this.dietId,
    this.calories,
    this.remark,
    this.setsCount,
    this.selectedDays,
  });
}
