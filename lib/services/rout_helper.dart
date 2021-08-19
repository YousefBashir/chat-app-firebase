import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutHelper {
  RoutHelper._();

  static RoutHelper routHelper = RoutHelper._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  gotToPage(String routeName) {
    navKey.currentState.pushNamed(routeName);
  }

  gotToPageWithReplacement(String routeName) {
    navKey.currentState.pushReplacementNamed(routeName);
  }

  back() {
    navKey.currentState.pop();
  }
}
