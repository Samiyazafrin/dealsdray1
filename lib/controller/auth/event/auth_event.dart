abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phoneNumber;

  LoginEvent(this.phoneNumber);
}

class OTPVerifyEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}
