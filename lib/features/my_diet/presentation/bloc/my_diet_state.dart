import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';

abstract class MyDietState extends Equatable {
  @override
  List<Object> get props => [];
}

@RegisterAs(MyDietState)
@injectable
class InitialMyDiet extends MyDietState {}

class LoadingMyDiet extends MyDietState {}

class LoadedMyDiet extends MyDietState {
  final DietDay dietDay;

  LoadedMyDiet(this.dietDay);

  @override
  List<Object> get props => [dietDay];
}

class EmptyMyDiet extends MyDietState {}

class Error extends MyDietState {}
