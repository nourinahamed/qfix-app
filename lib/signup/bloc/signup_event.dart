part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class RegisterAccount extends SignupEvent {
  RegisterAccount(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.password,
      required this.phonenumber,});
  String firstname;
  String lastname;
  String email;
  String password;
  String phonenumber;
}
