//   import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//   }

//   Future<void> initializeNotifications() async {
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     var initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String? payload) async {
//       // هنا يتم فتح التطبيق عند النقر على الإشعار
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage()),
//       );
//     }, onMessageOpenedApp: (RemoteMessage message) async {
//       // هنا يتم فتح التطبيق تلقائيًا عند استقبال الإشعار دون الحاجة إلى النقر عليه
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Local Notifications'),
//       ),
//       body: Center(
//         child: Text('الصفحة الرئيسية'),
//       ),
//     );
//   }
// }



// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   @override
//   void initState() {
//     super.initState();
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         // Handle notification message when the app is in the foreground.
//         _navigateToScreen(message);
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         // Handle notification message when the app is launched from a terminated state.
//         _navigateToScreen(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         // Handle notification message when the app is resumed from the background.
//         _navigateToScreen(message);
//       },
//     );
//     _firebaseMessaging.requestNotificationPermissions(
//       const IosNotificationSettings(sound: true, badge: true, alert: true),
//     );
//   }

//   void _navigateToScreen(Map<String, dynamic> message) {
//     // Extract any necessary data from the notification payload.
//     // Navigate to the appropriate screen based on the notification data.
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => NotificationScreen(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Firebase Messaging"),
//       ),
//       body: Center(
//         child: Text("Flutter Firebase Messaging Example"),
//       ),
//     );
//   }
// }

// class NotificationScreen extends StatelessWidget {
//   final Map<String, dynamic> message;

//   NotificationScreen(this.message);

//   @override
//   Widget build(BuildContext context) {
//     // Display the notification data or perform any other actions here.
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notification Screen"),
//       ),
//       body: Center(
//         child: Text("Notification Received: $message"),
//       ),
//     );
//   }
// }