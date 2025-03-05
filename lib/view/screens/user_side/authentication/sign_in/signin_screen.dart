import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';
import 'package:tech_shift/core/navigation_services.dart';
import 'package:tech_shift/view/screens/universal_widgets/validator.dart';
import 'package:tech_shift/view/screens/user_side/authentication/sign_up/sign_up_screen.dart';
import 'package:tech_shift/view/screens/user_side/authentication/widgets/auth_text_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  bool _moved = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2900),
    );

    _animation();

    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        setState(() {
          _moved = true;
        });
      },
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark ? black : white,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  appPrimary1,
                  Theme.of(context).brightness == Brightness.dark
                      ? green.withAlpha((0.1 * 255).toInt())
                      : appPrimary3.withAlpha((0.2 * 255).toInt()),

                  Theme.of(context).brightness == Brightness.dark
                      ? black.withAlpha((0.1 * 255).toInt())
                      : white.withAlpha((0.1 * 255).toInt()),
                ])),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 90,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 100,
                  maxWidth: 100,
                ),
                height: 100,
                width: 100,
                child: FadeTransition(
                    opacity: _logoOpacityAnimation,
                    child: Image.asset(logo, fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 70,
              left: 170,
              child: FadeTransition(
                opacity: _textOpacityAnimation,
                child: Text(
                  "Tech Shift",
                  style: GoogleFonts.dmSans(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 160,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.elliptical(100, 40), right: Radius.elliptical(100, 40)),
                      border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? grey.shade600
                              : grey.shade300,
                          width: 1),
                    ),
                    height: size.height,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            h10,
                            Text('Welcome back !', style: theme.titleLarge),
                            h10,
                            Text(
                              "Let's Discover Limitless Choices and Unmatched Convenience.",
                              style: theme.titleSmall,
                            ),
                            h20,
                            AuthTextField(
                              prefixIcon: CupertinoIcons.device_phone_portrait,
                              hintText: 'Phone Number',
                              keyboardType: TextInputType.emailAddress,
                              validator: validateMobileNumber,
                              controller: emailController,
                            ),
                            h20,
                            AuthPasswordTextField(
                                controller: passwordController,
                                hintText: 'Pasword',
                                keyboardType: TextInputType.visiblePassword,
                                validator: validatePassword,
                                prefixIcon: CupertinoIcons.lock),
                            h10,
                            Row(
                              children: [
                                Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('Forgot Password?')),
                              ],
                            ),
                            h10,
                            SizedBox(
                              width: size.width,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Sign In"),
                              ),
                            ),
                            h20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an account?',
                                    style: theme.bodyLarge),
                                w10,
                                TextButton(
                                    onPressed: () => NavigationService.instance
                                        .navigate(SignUpScreen()),
                                    child: Text('Sign Up'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _animation() {
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.25, curve: Curves.easeIn)),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.25, 0.5, curve: Curves.easeIn)),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.25, 0.5, curve: Curves.easeIn)),
    );
  }
}
