import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';
import 'package:tech_shift/view/screens/user_side/authentication/widgets/otp_textfield.dart';

import '../../../bloc/cubit/timer_cubit/timer_cubit.dart';

class SignUpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const SignUpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<SignUpVerificationScreen> createState() =>
      _SignUpVerificationScreenState();
}

class _SignUpVerificationScreenState extends State<SignUpVerificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  String otp = '';

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    context.read<TimerCubit>().startTimer();
    _animation();

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pinController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: size.width,
        height: height,
        decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark ? black : white,
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
              top: 30,
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
              top: 60,
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
            Card(
              margin: EdgeInsets.only(top: 160, left: 20, right: 20),
              shadowColor: Theme.of(context).brightness == Brightness.dark
                  ? white.withAlpha((0.1 * 255).toInt())
                  : white.withAlpha((0.6 * 255).toInt()),
              elevation: 10,
              color: Theme.of(context).brightness == Brightness.dark
                  ? white.withAlpha((0.1 * 255).toInt())
                  : white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: size.width,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h20,
                      SizedBox(
                        width: size.width,
                        child: Text(
                          'Verify Your Account',
                          style: theme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      h20,
                      Text(
                        'Welcome to Tech Shift.',
                      ),
                      h10,
                      Text(
                          'Please enter the 4 digit code that send to your Phonenumber +91 ${widget.phoneNumber}.'),
                      h30,
                      Center(
                        child: OtpTextField(
                            formKey: _formKey, pinController: _pinController),
                      ),
                      h30,
                      SizedBox(
                        width: size.width,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Verify')),
                      ),
                      h30,
                      BlocBuilder<TimerCubit, TimerState>(
                        builder: (context, state) {
                          if (state is TimerProgress) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Resend OTP in ${60 - state.elapsed} seconds',
                                  style: const TextStyle(
                                      color: green, fontSize: 16),
                                ),
                              ),
                            );
                          } else if (state is TimerInitial) {
                            return TextButton(
                              onPressed: () {
                                // context.read<SignUpOtpBloc>().add(
                                //     OnResendOTPButtonclickedEvent(widget.user));
                                context.read<TimerCubit>().startTimer();
                              },
                              child: Center(
                                child: const Text(
                                  'Resend OTP',
                                ),
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
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
