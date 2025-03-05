part of 'sign_up_bloc.dart';



@immutable
sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserModel user;
  const SignUpSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class SignUpFailure extends SignUpState {
  final String message;
  const SignUpFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

final class SignUpOtpSent extends SignUpState {
  final String verificationId;
  final int? forceResendingToken;

  const SignUpOtpSent({required this.verificationId, required this.forceResendingToken});

  @override
  List<Object?> get props => [verificationId, forceResendingToken];
}