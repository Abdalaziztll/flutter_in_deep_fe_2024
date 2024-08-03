// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:tdd_and_mocking/excpetions/auth_exception.dart';
import 'package:tdd_and_mocking/model/user_model.dart';

class AuthService {
  final Dio dio;
  AuthService({
    required this.dio,
  });
  late Response response;
  String baseurl = "https://rideshare.devscape.online/api/v1/auth/register";

  signUp(UserModel user) async {
    try {
      response = await dio.post(baseurl, data: user.toMap());
      // ? Happy Scenario
    } catch (e) {
      if (((e as DioException).response!.data["message"])
          .contains("Password must contain 1 or more uppercase characters")) {
        print("=========================");
        throw PasswordMustContainOneUppercase();
      }
    }
  }
}
