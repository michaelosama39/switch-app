import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunc {
  static Future launchUrlFun(String url) async {
    Uri uri = Uri.parse(url);
    if (url.isNotEmpty) {
      if (!await launchUrl(uri)) {
        throw 'Could not launch $uri';
      }
    }
  }

  static shareImage(String imgUrl, String name, String price) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(imgUrl));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    final dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$name.jpeg');
    await file.writeAsBytes(bytes);
    Share.shareFiles(
      ['${file.path}'],
      text: 'اسم المنج: $name\nسعر المنتح: $price',
    );
  }

  static shareText({String? text}) async {
    if (text != null) {
      await Share.share(
        text,
      );
    }
  }

  static Future<String> getTokenDevice() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    // deviceToken = token;
    print("token is $token");
    return token!;
  }
}
