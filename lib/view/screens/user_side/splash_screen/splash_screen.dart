import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';
import 'package:tech_shift/core/navigation_services.dart';
import 'package:tech_shift/view/screens/user_side/authentication/sign_in/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _moved = false; // Add a boolean to control the movement

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInExpo),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        _moved = true;
      });
      _animationController.forward().then((_) {
        Future.delayed(const Duration(milliseconds: 500), () {
          // navigate to login screen with fade
          NavigationService.instance.navigateUntil(SignInScreen());
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(children: [
              AnimatedPositioned(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 2800),
                top: _moved ? -5 : -5,
                left: _moved ? -screenWidth - 220 : -60,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(splashImg1))),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 2800),
                bottom: _moved ? -5 : -5,
                right: _moved ? -screenWidth - 220 : -60,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(splashImg2))),
                ),
              ),
            ]),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 250,
                  child: Image.asset(logo)),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                "Tech Shift",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              bottom: 20,
              child: FadeTransition(
                  opacity: _scaleAnimation,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Version 1.0',
                    style: Theme.of(context).textTheme.bodySmall,
                  ))),
        ],
      ),
    );
  }
}
