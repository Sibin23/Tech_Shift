import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget rn, [VoidCallback? voidCallback]) {
    navigationKey.currentState!
        .push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => rn,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300), // Adjust as needed
    )).then((value) {
      if (voidCallback != null) {
        voidCallback();
      }
    });
  }

  navigateUntil(Widget screen, [VoidCallback? voidCallback]) {
    navigationKey.currentState!.pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600), // Adjust as needed
        ),
        (route) => false).then((value) {
      if (voidCallback != null) {
        voidCallback();
      }
    });
  }

  goBack() {
    return navigationKey.currentState!.pop();
  }
}