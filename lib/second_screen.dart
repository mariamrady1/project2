import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/firebase_service.dart';
import 'package:project2/home_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  get1Token() async {
    String? mytoken = await FirebaseMessaging.instance.getToken();
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22');
    print(mytoken);
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22');
  }

  @override
  void initState() {
    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      print("#################mariam############3333333");
      print("Handling a background message: ${message.notification!.body}");
      AwesomeDialog(
              context: context,
              body: Image.asset("${message.notification!.body}"),
              dialogType: DialogType.info)
          .show();
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification!.title}');
        print(
            'Message also contained a notification: ${message.notification!.body}');
        //
        // ScaffoldMessenger.of(context).showSnackBar(

        //     SnackBar(content: Image.asset("${message.notification!.body}"),));
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return Container(
              color: Colors.white,
              child: Image.asset(
                "${message.notification!.body}",
                fit: BoxFit.fill,
              ),
            );
          },
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black,
          // transitionDuration: const Duration(milliseconds: 200),
        );
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertDialog(
        //       backgroundColor: Colors.white,
        //       content: Image.asset(
        //         "${message.notification!.body}",
        //         fit: BoxFit.fill,
        //       )),
        // );
      }
    });
    get1Token();
    FirebaseHelper.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.black, body: Container()));
  }
}
