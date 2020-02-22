import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/my_diet/data/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/get_diet.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_event.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';

@injectable
class MyDietBloc extends Bloc<MyDietEvent, MyDietState> {
  final MyDietState _initialState;
  final GetDiet getDiet;

  MyDietBloc(
    this._initialState,
    this.getDiet,
  );

  @override
  MyDietState get initialState => _initialState;

  @override
  Stream<MyDietState> mapEventToState(MyDietEvent event) async* {
    if (event is LoadMyDiet) {
      yield LoadingMyDiet();
      yield* _eitherLoadedOrError(
          await getDiet(GetDietParams(event.selectedDay)));
    }
  }

  Stream<MyDietState> _eitherLoadedOrError(
      Either<Failure, Diet> either) async* {
    yield either.fold(
      (_) => Error(),
      (diet) => LoadedMyDiet(diet),
    );
  }

  String _mapFailureToMessage() {}
}
