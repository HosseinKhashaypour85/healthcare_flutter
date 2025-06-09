part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CallSignInEvent extends AuthEvent {
  final String? phoneNumber;
  final String? password;

  CallSignInEvent(this.phoneNumber, this.password);
}

class CallSignUpEvent extends AuthEvent {
  final String userName;
  final String phoneNum;
  final String password;
  final String passwordConfirm;

  CallSignUpEvent(
    this.userName,
    this.phoneNum,
    this.password,
    this.passwordConfirm,
  );
}
