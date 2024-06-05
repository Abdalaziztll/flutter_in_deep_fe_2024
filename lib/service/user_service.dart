import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_data_from_api/config/core_config.dart';
import 'package:store_data_from_api/config/heares_config.dart';
import 'package:store_data_from_api/model/user_info_model.dart';
import 'package:store_data_from_api/model/user_model.dart';
import 'package:store_data_from_api/service/peaple_service.dart';

class UserService extends Service {
  Future<bool> logIn(UserModel user) async {
    response = await dio.post('https://dummyjson.com/auth/login',
        data: user.toMap(), options: getHeader(useToken: false));
    if (response.statusCode == 200) {
      core.get<SharedPreferences>().setString('token', response.data['token']);
      return true;
    } else {
      return false;
    }
  }

  Future<UserInfoModel?> getMyInfo() async {
    try {
      response =
          await dio.get('https://dummyjson.com/auth/me', options: getHeader());
      if (response.statusCode == 200) {
        UserInfoModel user = UserInfoModel.fromMap(response.data);
        return user;
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
      return null;
    }
  }
}
