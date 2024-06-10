import 'package:bloc_pattern/model/animal_model.dart';
import 'package:bloc_pattern/model/handling.dart';
import 'package:dio/dio.dart';

abstract class Service {
  Dio dio = Dio();
  late Response response;
}

abstract class AnimalService extends Service {
  String baseurl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/Animal";

  Future<ResultModel> getAnimal();
  Future<ResultModel> createNewAniml(String name);
}

class AnimalServiceImp extends AnimalService {
  @override
  Future<ResultModel> getAnimal() async {
    try {
      response = await dio.get(baseurl);

      List<AnimalModel> animals = List.generate(
        response.data.length,
        (index) => AnimalModel.fromMap(response.data[index]),
      );
      return ListOf(data: animals);
    } catch (e) {
      return ExceptionModel();
    }
  }

  @override
  Future<ResultModel> createNewAniml(String name) async {
    try {
      response = await dio.post(baseurl, data: {"name": name});
      AnimalModel animalModel = AnimalModel.fromMap(response.data);
      return animalModel;
    } catch (e) {
      print(e);
      return ExceptionModel();
    }
  }
}
