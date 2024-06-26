part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class SuccessInSignUp extends AuthState {

}

class ExceptioInSignUp extends AuthState{}