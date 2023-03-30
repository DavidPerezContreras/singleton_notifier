import 'package:flutter/material.dart';

class RouteSingleton {
  RouteSingleton._();
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
  final PageController pageController = PageController();
  static RouteSingleton? _singleton;
  static RouteSingleton get instance {
    _singleton = _singleton ?? RouteSingleton._();
    return _singleton!;
  }
}
