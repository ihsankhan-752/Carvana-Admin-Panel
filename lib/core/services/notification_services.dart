import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import '../notification_handler/fcm_access_token.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void getPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      provisional: true,
      criticalAlert: true,
      badge: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print("Authorized");
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print("Provisional State Granted");
      }
    } else {
      return;
    }
  }

  void getToken() async {
    String? token = await messaging.getToken();
    await FirebaseFirestore.instance.collection('tokens').doc(FirebaseAuth.instance.currentUser!.uid).set({
      'token': token,
    });
  }

  void initLocalNotifications(BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting, onDidReceiveNotificationResponse: (payload) {
      // handleMessage(context, message, message.data['userId']);
    });
  }

  void initNotification(BuildContext context) async {
    //=================Terminated State================//

    RemoteMessage? msg = await FirebaseMessaging.instance.getInitialMessage();
    if (msg != null) {
      if (kDebugMode) {
        print("Notification T State: ${msg.notification!.title}");
      }

      //=================In Background State==========//

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? msg) {
        if (msg != null) {
          if (kDebugMode) {
            print("Notification B State: ${msg.notification!.title}");
          }
        }
      });
    }

    //===========Notification in Foreground State==============//

    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        if (Platform.isAndroid) {
          if (!context.mounted) return;
          initLocalNotifications(context, remoteMessage);
          showNotification(context, remoteMessage);
        } else {
          if (!context.mounted) return;
          showNotification(context, remoteMessage);
          //handleNotification
        }
      }
    });
  }

  Future<void> showNotification(BuildContext context, RemoteMessage message) async {
    initLocalNotifications(context, message);
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      "High Importance Notification",
      importance: Importance.max,
    );
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "your channel description",
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentSound: true,
      presentBadge: true,
      presentAlert: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    });
  }

  sendNotificationToSpecificUser({required String title, required String body, required String toUserId}) async {
    DocumentSnapshot tokenSnap = await FirebaseFirestore.instance.collection('tokens').doc(toUserId).get();
    FcmAccessToken fcmAccessToken = FcmAccessToken();
    String accessToken;
    try {
      accessToken = await fcmAccessToken.getAccessToken();
    } catch (e) {
      if (kDebugMode) {
        print("Error getting access token: $e");
      }
      return;
    }

    Map<String, String> notificationHeader = {
      'Content-Type': "application/json",
      'Authorization': "Bearer $accessToken",
    };
    Map<String, dynamic> notificationBody = {
      'title': title,
      'body': body,
    };
    Map<String, dynamic> notificationData = {
      'status': "done",
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'click_action': "FLUTTER_NOTIFICATION_CLICK",
    };
    Map<String, dynamic> notificationFormat = {
      'message': {
        'notification': notificationBody,
        'data': notificationData,
        'token': tokenSnap['token'],
      },
    };

    try {
      final response = await http.post(
        Uri.parse("https://fcm.googleapis.com/v1/projects/restaurant-automation-6f0aa/messages:send"),
        headers: notificationHeader,
        body: jsonEncode(notificationFormat),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Notification sent successfully");
        }
      } else {
        if (kDebugMode) {
          print("Error sending notification: ${response.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("HTTP request failed: $e");
      }
    }
  }
}
