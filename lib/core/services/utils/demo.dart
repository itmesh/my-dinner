import 'package:my_dinner/core/services/utils/constants.dart';

class DemoUtils {
  static Future get smallDelay async =>
      await Future.delayed(DemoConstants.smallDuration);

  static Future get mediumDelay async =>
      await Future.delayed(DemoConstants.mediumDuration);

  static Future get largeDelay async =>
      await Future.delayed(DemoConstants.largeDuration);
}
