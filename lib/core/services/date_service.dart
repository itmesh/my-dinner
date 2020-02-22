import 'package:injectable/injectable.dart';

@injectable
class DateService {
  DateTime getCurrentDate() => DateTime.now();
}
