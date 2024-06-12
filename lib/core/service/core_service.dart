import 'package:dio/dio.dart';

abstract class CoreService {
  Dio dio = Dio();
  late Response response;
  
}
