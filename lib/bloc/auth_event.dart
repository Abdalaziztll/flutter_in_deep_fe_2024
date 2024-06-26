// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUp extends AuthEvent {
 final UserModel user;
  SignUp({
    required this.user,
  });
  
}
