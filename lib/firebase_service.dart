import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHelper {
  static Future<void> init() async {
    await Firebase.initializeApp();
  }

  static void message() {
    FirebaseMessaging.onMessage.listen((event) {
      print("===============on Message ===============");
      print(event.notification!.body);
      print("===============on Message ===============");
    }).onError((error) {
      print("===============on Message error ===============");

      print(error);
      print("===============on Message error ===============");
    });
  }

  static void messageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("===============on message Opened App ===============");
      print(event.notification!.body);
      print("===============on Message ===============");
    }).onError((error) {
      print("===============on on Message Opened App error ===============");

      print(error);
      print("===============on on Message Opened App error ===============");
    });
  }

//Background Message
  static Future<void> _onBackgroundMessage(RemoteMessage message) async {
    print("===============on message Opened App ===============");
    print(message.notification!.body);
    print("===============on Message ===============");
  }

  //init Background Message
  static void initBackgroundMessage() {
    try {
      FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    } catch (e) {
      print("===============on initBackgroundMessage error ===============");

      print("===============on initBackgroundMessage error ===============");
    }
  }

  static Future<String> getToken() async {
    try {
      final toekn = await FirebaseMessaging.instance.getToken() ?? "none";
      print(toekn);
      return toekn;
    } catch (e) {
      return "none";
    }
  }
}
