import 'package:flutter/material.dart';

class NavigationService {
  NavigationService({this.navigatorState});

  final NavigatorState? navigatorState;
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey {
    return _navigationKey;
  }

  NavigatorState get currentState {
    try {
      final state = navigatorState ?? _navigationKey.currentState;

      if (state == null) {
        throw Exception('Current State not found');
      }

      return state;
    } catch (e) {
      throw Exception('Current State not found');
    }
  }

  void pop<T>([T? result]) => currentState.pop(result);

  Future<T?> navigateTo<T>(String routeName, {dynamic arguments}) async =>
      currentState.pushNamed<T?>(routeName, arguments: arguments);

  Future<T?> replace<T, R>(String routeName, {dynamic arguments}) async =>
      currentState.popAndPushNamed<T?, R>(routeName, arguments: arguments);

  Future<T?> pushAndRemoveUntil<T>(
    String routeName, {
    dynamic arguments,
    bool Function(Route<dynamic> route)? popUntil,
  }) {
    final targetPredicate = popUntil ?? (Route<dynamic> route) => false;

    return currentState.pushNamedAndRemoveUntil<T?>(
      routeName,
      targetPredicate,
      arguments: arguments,
    );
  }
}
