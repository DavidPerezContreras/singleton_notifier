import 'package:flutter/material.dart';
import 'package:singleton_notifier/view/di/singleton.dart';
import 'package:singleton_notifier/view/pages/about_page.dart';
import 'package:singleton_notifier/view/pages/home_page.dart';

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
      home: Scaffold(
        body: PageView(
          children: [HomePage(), AboutPage()],
          onPageChanged: (newValue) {
            RouteSingleton.instance.currentIndexNotifier.value = newValue;
          },
          controller: RouteSingleton.instance.pageController,
        ),
        appBar: AppBar(
          title: const Text("Singleton Notifier"),
        ),
        bottomNavigationBar: AnimatedBuilder(
          animation: RouteSingleton.instance.currentIndexNotifier,
          builder: (context, child) => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "About", icon: Icon(Icons.person))
            ],
            currentIndex: RouteSingleton.instance.currentIndexNotifier.value,
            onTap: (newValue) {
              RouteSingleton.instance.currentIndexNotifier.value =
                  newValue; //Update BottomNavigationBar current index
              RouteSingleton.instance.pageController.animateToPage(newValue,
                  duration: Duration(milliseconds: 400),
                  curve: Curves
                      .linear); //Tell PageView's pageController to go to appropiate page
            },
          ),
        ),
      ),
    );
  }
}
