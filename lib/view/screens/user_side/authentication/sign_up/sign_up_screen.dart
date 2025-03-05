import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';
import 'package:tech_shift/core/debouncer.dart';
import 'package:tech_shift/core/navigation_services.dart';
import 'package:tech_shift/domain/model/user_model.dart';
import 'package:tech_shift/view/screens/universal_widgets/custom_snacbar.dart';
import 'package:tech_shift/view/screens/universal_widgets/validator.dart';
import 'package:tech_shift/view/screens/user_side/authentication/sign_up/sign_up_verification_screen.dart';
import 'package:tech_shift/view/screens/user_side/authentication/widgets/auth_text_filed.dart';

import '../../../bloc/authentication/sign_up_bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;
  final _debouncer = Debouncer(milliseconds: 600);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation();
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            CustomSnackBar.show(
              context,
              'OTP sent to +91 ${_phoneController.text.trim()}',
              green,
              duration: const Duration(seconds: 1),
              onPressed: () => NavigationService.instance
                  .navigateUntil(SignUpVerificationScreen(
                phoneNumber: _phoneController.text.trim(),
              )),
            );
          } else if (state is SignUpFailure) {
            CustomSnackBar.show(context, state.message, red);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? black
                      : white,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        appPrimary3,
                        Theme.of(context).brightness == Brightness.dark
                            ? black.withAlpha((0.1 * 255).toInt())
                            : white.withAlpha((0.1 * 255).toInt()),
                        Theme.of(context).brightness == Brightness.dark
                            ? black.withAlpha((0.2 * 255).toInt())
                            : white.withAlpha((0.6 * 255).toInt()),
                      ])),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 10,
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
                    top: 80,
                    left: 95,
                    child: FadeTransition(
                      opacity: _textOpacityAnimation,
                      child: Text(
                        "Tech Shift",
                        style: GoogleFonts.dmSans(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height,
                    margin: EdgeInsets.only(top: 120),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            // h20,
                            SizedBox(
                              width: size.width,
                              child: Text(
                                textAlign: TextAlign.start,
                                'Let\'s Create Your Account',
                                style: theme.titleLarge,
                              ),
                            ),
                            h20,
                            AuthTextField(
                                prefixIcon: CupertinoIcons.person,
                                controller: _nameController,
                                hintText: 'User Name',
                                validator: validateTextfield,
                                keyboardType: TextInputType.text),
                            h20,
                            AuthTextField(
                              prefixIcon: CupertinoIcons.device_phone_portrait,
                              controller: _phoneController,
                              hintText: 'Phone Number',
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            h20,
                            AuthPasswordTextField(
                                prefixIcon: CupertinoIcons.lock,
                                controller: _passwordController,
                                hintText: 'Password',
                                validator: validatePassword,
                                keyboardType: TextInputType.visiblePassword),
                            h20,
                            AuthConfirmPasswordTextField(
                                prefixIcon: CupertinoIcons.lock,
                                controller: _confirmPasswordController,
                                hintText: 'Confirm Password',
                                validator: validatePassword,
                                keyboardType: TextInputType.visiblePassword),
                            h10,
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: appPrimary3,
                                  checkColor: white,
                                  value: _isChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _isChecked = newValue!;
                                    });
                                  },
                                ),
                                Text("I agree to the"),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Terms & Conditions'),
                                )
                              ],
                            ),
                            h10,
                            SizedBox(
                              width: size.width,
                              height: 60,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _validate();
                                  },
                                  child: Text('Sign Up')),
                            ),
                            h30,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?'),
                                TextButton(
                                  onPressed: () {
                                    NavigationService.instance.goBack();
                                  },
                                  child: Text('Login'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _validate() {
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      _debouncer.run(() {
        CustomSnackBar.show(
            context,
            'Passwords do not match.'
            'Please try again.',
            red);
      });
    } else {
      if (_formKey.currentState!.validate()) {
        if (!_isChecked) {
          _debouncer.run(
            () {
              CustomSnackBar.show(
                  context, 'Please accept the terms and conditions.', red);
            },
          );
        } else {
          final userData = UserModel(
              userName: _nameController.text.trim(),
              password: _passwordController.text.trim(),
              phoneNumber: _phoneController.text.toLowerCase().trim());
          print(userData.phoneNumber);
          context
              .read<SignUpBloc>()
              .add(SignUpButtonClickEvent(userModel: userData));
        }
      }
    }
  }

  void _animation() {
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
