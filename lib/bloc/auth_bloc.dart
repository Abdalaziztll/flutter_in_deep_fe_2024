import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intro_to_bloc/model/user_model.dart';
import 'package:intro_to_bloc/service/mock/mock_auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUp>((event, emit) async {
      log(event.user.toMap().toString());
      var status = await MockAuthService().signUp(event.user);
      if (status) {
        emit(SuccessInSignUp());
      } else {
        emit(ExceptioInSignUp());
      }
    });
  }
}
