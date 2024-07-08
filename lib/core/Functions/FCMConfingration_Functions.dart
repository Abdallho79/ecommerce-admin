import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmConfig() {
  FirebaseMessaging.onMessage.listen((msg) {

    Get.snackbar(msg.notification!.title!, msg.notification!.body!);
    FlutterRingtonePlayer.playNotification();

  });
}

requestNotiPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
