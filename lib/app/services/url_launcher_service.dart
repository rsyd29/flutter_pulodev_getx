import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchInBrowser(String url) async {
    Uri linkUrl = Uri.parse(url);
    if (!await launchUrl(
      linkUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
