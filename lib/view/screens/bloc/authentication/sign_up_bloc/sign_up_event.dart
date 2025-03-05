part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpButtonClickEvent extends SignUpEvent {
  final UserModel userModel;

  SignUpButtonClickEvent({required this.userModel});
}

final class OnResendOTPButtonclickedEvent extends SignUpEvent {
  final UserModel userModel;
  final String otp;
  final String phoneNumber;
  OnResendOTPButtonclickedEvent(this.userModel, this.otp, this.phoneNumber);
}
