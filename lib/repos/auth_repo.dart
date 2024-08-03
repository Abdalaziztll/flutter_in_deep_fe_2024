// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tdd_and_mocking/excpetions/auth_exception.dart';
import 'package:tdd_and_mocking/model/reposen_model.dart';
import 'package:tdd_and_mocking/model/user_model.dart';
import 'package:tdd_and_mocking/service/auth_service.dart';

class AuthRepo {
  AuthService service;
  AuthRepo({
    required this.service,
  });

  Future<ReponseData> signup(UserModel user) async {
    try {
      var data = await service.signUp(user);
      // ?
      return DataSuccess();
    } catch (e) {
      print(e.runtimeType);
      if (e is PasswordMustContainOneUppercase) {
        return DataFailed(message: "you Must Enter Your Password Correctly");
      } else {
        throw e;
      }
    }
  }
}
