import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_data_from_api/config/core_config.dart';

Options getHeader({bool useToken = true}) {
  if (useToken) {
    return Options(
      headers: {
        'Authorization':
            'Bearer ${core.get<SharedPreferences>().getString('token')}',
      },
    );
  } else {
    return Options();
  }
}
