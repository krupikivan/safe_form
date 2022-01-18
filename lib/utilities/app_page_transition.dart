import 'package:flutter/material.dart';

enum PageTransitionType {
  fade,
  rightToLeft,
}

class AppPageTransition extends PageRouteBuilder {
  AppPageTransition({
    required this.child,
    required this.type,
    required this.fullScreenDialog,
    RouteSettings? settings,
  }) : super(
          pageBuilder: (context, _, __) => child,
          settings: settings,
          fullscreenDialog: fullScreenDialog,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (type) {
              case PageTransitionType.fade:
                return FadeTransition(opacity: animation, child: child);
              case PageTransitionType.rightToLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              default:
                return FadeTransition(opacity: animation, child: child);
            }
          },
        );
  final Widget child;
  final PageTransitionType type;
  final bool fullScreenDialog;
}
