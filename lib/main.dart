import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chatapp/app/app.router.dart';
import 'package:chatapp/config/ColorConfig.dart';
import 'package:chatapp/di/locator.dart';
import 'package:chatapp/services/PushNotificationService.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/setupBottomSheetUi.dart';
import 'app/setupDilogUi.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp();
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          ledColor: Colors.white,
        ),
      ],
    );
    setupLocator();
    setUpBototmSheet();
    setupDilogUi();
    runApp(MyApp());
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await showNotification(
    message.data['title'],
    message.data['body'],
    image: message.data['image'],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PushNotificationService _notificationService =
        locator<PushNotificationService>();
    _notificationService.initmessaging();

    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskColor = Colors.black.withOpacity(0.5)
      ..maskType = EasyLoadingMaskType.custom
      ..backgroundColor = ColorConfig.accentColor.withAlpha(1)
      ..textColor = Colors.white
      ..indicatorColor = Colors.white;

    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Cupidknot',
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: ColorConfig.accentColor,
        primaryColor: ColorConfig.primaryColor,
        fontFamily: 'Poppins',
      ), //authService().handleAuth()//SubScriptionView()//KycViewHolder()//RegistrationViewHolder(currentPageToShow: 3,),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EasyLoading.init();

    return Scaffold(
      body: Center(
        child: Container(
            width: 250,
            height: 250,
            child: Image.asset("assets/images/logowithshadow.png")),
      ),
    );
  }
}
