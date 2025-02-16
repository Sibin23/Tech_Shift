part of 'login_bloc.dart';


sealed class LoginEvent {

}
final class LoginButtonClickEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonClickEvent({required this.email, required this.password});
}
