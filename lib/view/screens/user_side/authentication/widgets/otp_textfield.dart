// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tech_shift/core/colors.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController pinController;
  final GlobalKey<FormState> formKey;
  const OtpTextField({
    super.key,
    required this.pinController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: theme == Brightness.dark ? appPrimary6 : appPrimary1),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 24,
                    height: 2,
                    color: theme == Brightness.dark ? appPrimary5 : appPrimary2,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: theme == Brightness.dark
                          ? grey.shade300
                          : appPrimary3),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: theme == Brightness.dark ? appPrimary2 : appPrimary5,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: theme == Brightness.dark
                          ? grey.shade300
                          : grey.shade900),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
