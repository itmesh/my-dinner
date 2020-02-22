import 'package:either_option/either_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_dinner/features/my_diet/data/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/my_diet_mock.dart';
import 'package:my_dinner/features/my_diet/presentation/bloc/bloc.dart';

import '../fixture_reader.dart';

main() {
  MyDietBloc bloc;
  GetDietMock getDietMock;
  InitialMyDiet initialState;

  setUp(() {
    getDietMock = GetDietMock();
    initialState = InitialMyDiet();
    bloc = MyDietBloc(initialState, getDietMock);
  });

  test('initialState', () {
    expect(bloc.initialState, initialState);
  });

  test('mapEventToState.LoadMyDiet - initial state - should emit LoadedMyDiet state with diet', () {
    // arrange
    Diet diet = Diet.fromJson(jsonFixture('diet.json'));
    when(getDietMock.call(any)).thenAnswer((_) async => Right(diet));
    // assert later
    final expected = [
      InitialMyDiet(),
      LoadingMyDiet(),
      LoadedMyDiet(diet),
    ];
    expect(bloc, emitsInOrder(expected));
    // act
    bloc.add(LoadMyDiet(DateTime.now()));
  });

  test('mapEventToState.LoadMyDiet - initial state - should emit Error state', () {
    // arrange
    when(getDietMock.call(any)).thenThrow(Exception());
    // assert later
    final expected = [
      InitialMyDiet(),
      LoadingMyDiet(),
      Error(),
    ];
    expect(bloc, emitsInOrder(expected));
    // act
    bloc.add(LoadMyDiet(DateTime.now()));
  });
}
