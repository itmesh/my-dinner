import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_event.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/my_diet_state.dart';

class MyDietBloc extends Bloc<MyDietEvent, MyDietState> {

  final MyDietState _initialState;

  MyDietBloc(this._initialState);

  @override
  MyDietState get initialState => _initialState;

  @override
  Stream<MyDietState> mapEventToState(MyDietEvent event) {
  }
}
