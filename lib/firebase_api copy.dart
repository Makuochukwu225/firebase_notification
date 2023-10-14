// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handleBackgroundMessage(RemoteMessage? message) async {
//   if (message == null) return;
//   print(message.notification?.title);
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'streamlivr1', // id
//     'streamlivr', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.max,
//   );

//   handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     print(message.notification?.title);
//   }

//   initPushNotifiction() {
//     _firebaseMessaging.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification!;
//       AndroidNotification? android = message.notification?.android!;

//       if (android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channelDescription: channel.description,
//                 icon: android.smallIcon,
//                 // other properties...
//               ),
//             ));
//       }
//     });
//   }

//   initNotification() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     log(fcmToken.toString());

//     await setuo();
//     initPushNotifiction();
//   }

//   setuo() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     if (initialMessage != null) {
//       handleMessage(initialMessage);
//     }

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//   }
// }
