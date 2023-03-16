part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  
}

// class LoginButtonPressed extends LoginEvent{
//   LoginButtonPressed({required this.email, required this.password});
//   String email;
//   String password;
// }

class LoginButtonPressed extends LoginEvent {
  String email;
  String password;
  LoginButtonPressed({required this.email, required this.password});
}
