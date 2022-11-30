import 'package:flutter/material.dart';
import 'package:front/page/appointment_page.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/request_appointment_page.dart';
import 'package:front/page/video_page.dart';

import '../app_controller.dart';
import '../page/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            title: 'Santos Futebol Clube',
            theme: ThemeData(
                primaryColor: Colors.blue,
                brightness: AppController.instance.isDartTheme
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
              '/appointment': (context) => AppointmentPage()
            },
          );
        });
  }
}
