import 'package:dio/dio.dart';
import 'package:intro_to_bloc/model/user_model.dart';

abstract class Service {
  Dio dio = Dio();
  late Response response;
}

abstract class AuthService extends Service {
  String baseUrl = "";
  Future<bool> signUp(UserModel user);
}

class AuthSerivceImp extends AuthService {
  @override
  Future<bool> signUp(UserModel user) async {
    try {
      response = await dio.post(baseUrl, data: user.toMap());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
