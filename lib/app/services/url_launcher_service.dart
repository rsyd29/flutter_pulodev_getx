import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchInAppWebView(String url) async {
    Uri linkUrl = Uri.parse(url);
    if (!await launchUrl(
      linkUrl,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true,
      ),
    )) {
      throw 'Could not launch $url';
    }
  }
}
