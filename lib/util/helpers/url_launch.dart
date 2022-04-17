import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class URLHelper {
  static Future<void> open(String url, [VoidCallback? onError]) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      onError!();
    }
  }
}
