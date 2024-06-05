import 'package:dio/dio.dart';
import 'package:store_data_from_api/config/heares_config.dart';
import 'package:store_data_from_api/model/people_model.dart';

abstract class Service {
  Dio dio = Dio();
  late Response response;
  String baseurl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people";
}

class PeapleServiceImp extends Service {
  Future<List<PeopleModel>> getPoeple() async {
    try {
      response = await dio.get(baseurl,options: getHeader(useToken: false));
      if (response.statusCode == 200) {
        List<PeopleModel> peaple = List.generate(
          response.data.length,
          (index) => PeopleModel.fromMap(response.data[index]),
        );
        return peaple;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e);
      return [];
    }
  }
}
