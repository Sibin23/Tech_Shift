import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/view/screens/bloc/cubit/password_visibility_cubit/password_visibility_cubit.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.prefixIcon,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      keyboardType: keyboardType,
      cursorWidth: 2,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style:
          GoogleFonts.roboto(fontSize: 20, color: theme ? grey.shade300 : grey),
      decoration: InputDecoration(
        filled: true,
        fillColor:theme ? textfieldBlack: textfieldWhite,
        prefixIcon: Icon(
          prefixIcon,
        ),
        prefixIconColor: theme ? grey.shade300 : grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 20,
          color: theme ? grey.shade300 : grey,
        ),
      ),
      validator: validator,
    );
  }
}

class AuthPasswordTextField extends StatelessWidget {
  const AuthPasswordTextField(
      {super.key,
      this.prefixIcon,
      this.voidCallback,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isObscured,
          cursorWidth: 2,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.roboto(
              fontSize: 20, color: theme ? grey.shade300 : grey),
          decoration: InputDecoration(
              filled: true,
              fillColor: theme ? textfieldBlack : textfieldWhite,
              prefixIcon: Icon(
                prefixIcon,
              ),
              prefixIconColor: theme ? grey.shade300 : grey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: 20,
                color: theme ? grey.shade300 : grey,
              ),
              suffixIcon: IconButton(
                onPressed: voidCallback,
                icon: Icon(
                    state.isObscured ? Icons.visibility : Icons.visibility_off),
              ),
              counterStyle: GoogleFonts.roboto(color: Colors.red)),
          validator: validator,
        );
      },
    );
  }
}

class AuthConfirmPasswordTextField extends StatelessWidget {
  const AuthConfirmPasswordTextField(
      {super.key,
      this.prefixIcon,
      this.voidCallback,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<ConfirmPasswordVisibilityCubit,
        ConfirmPasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isObscured,
          cursorWidth: 2,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.roboto(
              fontSize: 20, color: theme ? grey.shade300 : grey),
          decoration: InputDecoration(
              filled: true,
              fillColor: theme ? textfieldBlack : textfieldWhite,
              prefixIcon: Icon(
                prefixIcon,
              ),
              prefixIconColor: theme ? grey.shade300 : grey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: 20,
                color: theme ? grey.shade300 : grey,
              ),
              suffixIcon: IconButton(
                onPressed: voidCallback,
                icon: Icon(
                    state.isObscured ? Icons.visibility : Icons.visibility_off),
              ),
              counterStyle: GoogleFonts.roboto(color: Colors.red)),
          validator: validator,
        );
      },
    );
  }
}
