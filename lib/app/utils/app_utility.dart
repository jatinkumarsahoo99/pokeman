import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtility{
  static showProgressIndicator() {
    EasyLoading.show(dismissOnTap: true);
  }

  static Future<bool> showSuccessDialog(String? message) async {
    await EasyLoading.showSuccess(message??"",duration: const Duration(seconds: 3));
    return true;
  }

  static disMissProgressIndicator() {
    EasyLoading.dismiss();
  }

  static void launchWebUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}