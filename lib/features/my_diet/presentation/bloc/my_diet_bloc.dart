import 'package:either_option/either_option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet_order.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/get_diet.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/order_diet.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_event.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';

@injectable
class MyDietBloc extends Bloc<MyDietEvent, MyDietState> {
  final MyDietState _initialState;
  final GetDiet getDiets;
  final OrderDiet orderDiet;

  MyDietBloc(
    this._initialState,
    this.getDiets,
    this.orderDiet,
  );

  @override
  MyDietState get initialState => _initialState;

  @override
  Stream<MyDietState> mapEventToState(MyDietEvent event) async* {
    if (event is LoadMyDiet) {
      yield LoadingMyDiet();
      yield* _eitherLoadedOrError(
          await getDiets(GetDietParams(event.selectedDay)));
    } else if (event is OrderMyDiet) {
      yield LoadingMyDiet();
      Either<Failure, DietOrder> order =
          await orderDiet(OrderDietParams(event.selectedDay));
      yield order.fold(
        (_) => Error(),
        (order) => OrderedMyDiet(order),
      );
    }
  }

  Stream<MyDietState> _eitherLoadedOrError(
      Either<Failure, DietDay> either) async* {
    yield either.fold(
      (_) => Error(),
      (diets) => diets.isEmpty ? EmptyMyDiet() : LoadedMyDiet(diets),
    );
  }
}
