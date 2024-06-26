import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project2/firebase_options.dart';
import 'package:project2/firebase_service.dart';
import 'package:project2/home_screen.dart';
import 'package:project2/second_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('*****************background************************');
  //print("Handling a background message: ${message.notification!.title}");
  print("Handling a background message: ${message.notification!.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseHelper.init();
  FirebaseHelper.messageOpenedApp();
  FirebaseHelper.message();
  FirebaseHelper.initBackgroundMessage();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    FirebaseHelper.init();
    super.initState();
    //initializeNotifications();
  }

  // Future<void> initializeNotifications() async {
  //   var initializationSettingsAndroid =
  //       AndroidInitializationSettings('app_icon');
  //   var initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);

  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //   //     onSelectNotification: (String? payload) async {
  //   //   // هنا يتم فتح التطبيق عند النقر على الإشعار
  //   //   Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(builder: (context) => HomeScreen()),
  //   //   );
  //   // },
  //    onDidReceiveNotificationResponse: (RemoteMessage message) async {
  //     // هنا يتم فتح التطبيق تلقائيًا عند استقبال الإشعار دون الحاجة إلى النقر عليه
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        )
            // systemOverlayStyle: SystemUiOverlayStyle(
            //    statusBarColor: Colors.black,
            //   statusBarBrightness: Brightness.light,
            //   statusBarIconBrightness: Brightness.dark,
            //   systemNavigationBarColor: Colors.black,

            ),

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SecondScreen(),
    );
  }
}
