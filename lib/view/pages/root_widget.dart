import 'package:flutter/material.dart';
import 'package:singleton_notifier/view/di/singleton.dart';
import 'package:singleton_notifier/view/pages/about_page.dart';
import 'package:singleton_notifier/view/pages/home_page.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (newValue) {
          RouteSingleton.instance.currentIndexNotifier.value = newValue;
        },
        controller: RouteSingleton.instance.pageController,
        children: const [HomePage(), AboutPage()],
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
                duration: const Duration(milliseconds: 200),
                curve: Curves
                    .easeOutExpo); //Tell PageView's pageController to go to appropiate page
          },
        ),
      ),
    );
  }
}
