import 'dart:developer';

import 'package:intro_to_bloc/model/user_model.dart';
import 'package:intro_to_bloc/service/remote/auth_service.dart';
import 'package:mockito/mockito.dart';

class MockAuthService extends Mock implements AuthSerivceImp {
  @override
  Future<bool> signUp(UserModel user) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      if (user.isEmtpy()) {
        return true;
      } else {
        throw Exception();
      }
    } catch (e) {
      return false;
    }
  }
}
