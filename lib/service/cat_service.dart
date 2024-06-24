import 'package:dio/dio.dart';
import 'package:riverpod_intro/model/cat_model.dart';

class CatService {
  Dio req = Dio();
  late Response response;
  String baseurl = "https://freetestapi.com/api/v1/cats";

  Future<ResutlModel> getAllCat() async {
    try {
      response = await req.get(baseurl);
      return ListOf(
          resutlAsList: List.generate(
        response.data.length,
        (index) => CatModel.fromMap(response.data[index]),
      ));
    } catch (e) {
      throw e;
    }
  }
}

class SimpeEaxmple {
  int counter = 0;

  Future<int> increament() async {
    await Future.delayed(Duration(seconds: 3));
    return counter++;
  }
}
