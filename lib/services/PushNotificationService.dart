import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/utils/SharedpreferenceUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationService {
  Future<String> getfcmtoken() async {
    FirebaseMessaging _fcm = FirebaseMessaging.instance;
    String? fcmToken = await _fcm.getToken();
    return fcmToken.toString();
  }

  initmessaging() {
    FirebaseMessaging.instance.getInitialMessage().then((value) => {});

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        Map<String, dynamic>? notificationMessage = message.data;

        print("HETf dc:- " + notificationMessage.toString());

        if (notificationMessage != null) {
          showNotification(
              notificationMessage['title'], notificationMessage['body'],
              image: notificationMessage['image']);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {},
    );
  }
}

showNotification(String title, String message, {String? image}) async {
  if (image != null) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: Random().nextInt(2147483647),
            title: title,
            body: message,
            channelKey: "basic_channel",
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture: image));
  } else {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: Random().nextInt(2147483647),
            title: title,
            body: message,
            channelKey: "basic_channel"));
  }

  await updateNotificationCount();
}

//Shared prefrence code never be included here but we implememted it here beacuse of some background work when notification arrives
updateNotificationCount() async {
  SharedpreferenceUtils _sharedpreferenceUtils = SharedpreferenceUtils();
  try {
    int notificationCount = await getNotificationCount();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(
        _sharedpreferenceUtils.notificationCount, notificationCount + 1);
    return true;
  } catch (e) {
    return false;
  }
}

Future<int> getNotificationCount() async {
  SharedpreferenceUtils _sharedpreferenceUtils = SharedpreferenceUtils();
  try {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(_sharedpreferenceUtils.notificationCount) ?? 0;
  } catch (e) {
    return 0;
  }
}
