import 'package:flutter/material.dart';
import 'package:singleton_notifier/view/pages/login_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      title: 'Singleton Notifier',
      home: LoginWidget(),
    );
  }
}
