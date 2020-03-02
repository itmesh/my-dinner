import 'package:either_option/either_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/repositories/my_diet_repository_mock.dart';
import 'package:my_dinner/features/my_diet/domain/usecases/get_diet.dart';

final Diet mockedDiet = Diet(name: 'some diet');

main() {
  GetDiet getDiet;
  MyDietRepositoryMock myDietRepositoryMock;

  setUpAll(() {
    myDietRepositoryMock = MyDietRepositoryMock();
    getDiet = GetDiet(myDietRepositoryMock);
  });

  Future<Diet> _callGetDiet() async {
    return (await getDiet(GetDietParams(DateTime.now()))).fold(
      (_) => null,
      (_) => mockedDiet,
    );
  }

  test('GetDiet - get diet from mocked repository - should return mocked diet', () async {
    // arrange
    when(myDietRepositoryMock.getDiet(any))
        .thenAnswer((_) async => Right(mockedDiet));
    // act
    Diet receivedDiet = await _callGetDiet();
    // assert
    expect(receivedDiet, mockedDiet);
  });

  test('GetDiet - get diet when server down - should return failure', () async {
    // arrange
    when(myDietRepositoryMock.getDiet(any))
        .thenAnswer((_) async => Left(Failure()));
    // act
    Diet receivedDiet = await _callGetDiet();
    // assert
    expect(receivedDiet, isNull);
  });

}
