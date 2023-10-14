import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  if (message == null) return;
  log('${message.notification?.title}');
}

class FirebaseApi {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Hello');
    print(fcmToken.toString());
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    _firebaseMessaging.getInitialMessage().then((value) {
      if (value != null) {
        log(value.notification!.title.toString());
      }
    });
  }

  static handleMessage(RemoteMessage? message) {
    if (message == null) return;
    log('${message.notification?.title}');
  }
}
