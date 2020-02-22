import 'package:either_option/either_option.dart';
import 'package:equatable/equatable.dart';
import 'package:my_dinner/core/services/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
