import 'package:url_launcher/url_launcher.dart';

class UriUtil {
  ///call_telephone
  Future<void> makePhoneCall(String phoneNumber) async {
    if (phoneNumber != "") {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }
  }
}
