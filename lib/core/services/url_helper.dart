import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:url_launcher/url_launcher.dart';

class URLHelper {
  static final _log = Log('URLHelper');

  static open(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _log.error('Error launching url $url');
    }
  }
}
