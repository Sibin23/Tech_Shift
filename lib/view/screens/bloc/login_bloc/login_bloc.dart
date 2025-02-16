// create a Loginbloc base class

import 'package:bloc/bloc.dart';

part 'login_events.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
LoginBloc():super(LoginInitial()){
  on<LoginButtonClickEvent>(loginButtonClickEvent);
}
Future<void> loginButtonClickEvent(
  LoginButtonClickEvent event, Emitter<LoginState> emit
) async{
  emit(LoginLoading());
}
}
