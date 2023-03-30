import 'package:flutter/material.dart';

class RouteSingleton {
  RouteSingleton._();

  static RouteSingleton instance = RouteSingleton._();

  ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
  PageController pageController = PageController();
}
