import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _HomePageState();
}

class _HomePageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("About"));
  }
}
