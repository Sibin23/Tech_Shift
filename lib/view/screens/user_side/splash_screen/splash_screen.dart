import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/navigation_services.dart';
import 'package:tech_shift/view/screens/user_side/login_screen/login_screen.dart';

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


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2400),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
   
    // Start the fade-out animation and then navigate.
    Future.delayed(const Duration(milliseconds: 100), () {
      _animationController.forward().then((_) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          // add a small delay before navigation
          NavigationService.instance.navigateUntil(LoginScreen());
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: black,
            height: double.infinity,
            width: double.infinity,
            child: Stack(children: [
              Positioned(
                top: -50, // Adjust for smoother overlap
                right: -50, // Adjust for smoother overlap
                child: Container(
                  height: 250, // Slightly larger for smoother look
                  width: 250, // Slightly larger for smoother look
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.withOpacity(0.7), // Reduced opacity
                    gradient: RadialGradient(
                      colors: [
                        Colors.purple.withOpacity(0.5),
                        Colors.black.withOpacity(0.3),
                      ],
                      stops: [0.3, 1.0], // Adjust stops for smoother gradient
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 190, // Adjust for smoother overlap
                left: -100, // Adjust for smoother overlap
                child: Container(
                  height: 220, // Slightly larger for smoother look
                  width: 220, // Slightly larger for smoother look
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appThemeColor2.withOpacity(0.6), // Reduced opacity
                    boxShadow: [
                      BoxShadow(
                        color: appThemeColor2.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                    gradient: RadialGradient(
                      colors: [
                        appThemeColor2.withOpacity(0.5),
                        Colors.black.withOpacity(0.3),
                      ],
                      stops: [0.3, 1.0], // Adjust stops for smoother gradient
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -300, // Adjust for smoother overlap
                right: -200, // Adjust for smoother overlap
                child: Container(
                  height: 550, // Slightly larger for smoother look
                  width: 550, // Slightly larger for smoother look
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.withOpacity(0.5), // Reduced opacity
                    gradient: RadialGradient(
                      colors: [
                        Colors.purple.withOpacity(0.5),
                        Colors.black.withOpacity(0.3),
                      ],
                      stops: [0.3, 1.0], // Adjust stops for smoother gradient
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.2),
                        blurRadius: 50,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              BackdropFilter(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50)),
            ]),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/logo.png')),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                "Tech Shift",
                style: GoogleFonts.ibmPlexSerif(color: white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              bottom: 20,
              child: Text(textAlign: TextAlign.center, 'Version 1.0')),
        ],
      ),
    );
  }
}
