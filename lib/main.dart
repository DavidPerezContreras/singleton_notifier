import 'package:flutter/material.dart';
import 'package:singleton_notifier/view/di/singleton.dart';
import 'package:singleton_notifier/view/pages/about_page.dart';
import 'package:singleton_notifier/view/pages/home_page.dart';
import 'package:singleton_notifier/view/pages/login_widget.dart';
import 'package:singleton_notifier/view/pages/root_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singleton Notifier',
      home: LoginWidget(),
    );
  }
}
