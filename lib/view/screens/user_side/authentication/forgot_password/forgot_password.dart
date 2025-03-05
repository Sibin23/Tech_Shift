import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 400),
                      child: const Text(
                        'Reset your Password',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    h10,
                    FadeIn(
                      duration: const Duration(milliseconds: 400),
                      child: const Text(
                        "Enter the Email Address you used when you joined and We'll send you instructions to reset your password",
                      ),
                    ),
                  ],
                ),
                h30,
                SizedBox(
                  width: size.width,
                  height: 200,
                  child: FadeInDown(
                    child: Lottie.asset(
                        'assets/images/forgot_password_animation.json'),
                  ),
                ),
                h30,
                FadeInDown(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: appThemePurple800))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                            color: black,
                          )),
                    ),
                  ),
                ),
                h30,
                Center(
                  child: FadeInDown(
                    child: MaterialButton(
                      minWidth: size.width * .4,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: appThemePurple800,
                      onPressed: () {},
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 20, color: white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
