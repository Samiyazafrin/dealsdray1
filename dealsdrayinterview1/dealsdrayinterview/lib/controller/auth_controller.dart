import 'package:dealsdrayinterview/controller/auth/event/auth_event.dart';
import 'package:dealsdrayinterview/controller/auth/state/auth_state.dart';
import 'package:dealsdrayinterview/controller/auth_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      // Simulate asynchronous authentication process
      await Future.delayed(const Duration(seconds: 2));
      // Simulate success
      yield AuthSuccess();
      // Perform phone number validation here if needed
    } else if (event is OTPVerifyEvent) {
      yield AuthLoading();
      // Simulate asynchronous authentication process
      await Future.delayed(const Duration(seconds: 2));
      // Simulate success
      yield AuthSuccess();
    } else if(event is RegisterEvent){

    }
  }
}
