import 'package:flutter_bloc_in_deep/core/model/handling.dart';
import 'package:flutter_bloc_in_deep/core/model/product_model.dart';
import 'package:flutter_bloc_in_deep/core/service/core_service.dart';

abstract class ProductService extends CoreService {
  String baseurl = "https://freetestapi.com/api/v1/products/1";
  Future<ResultModel> getOneProduct();
}

class ProductServiceImp extends ProductService {
     ProductModel? productModel = null;
  @override
  Future<ResultModel> getOneProduct() async {
    try {
      print(productModel);
      if (productModel != null) {
        print("From Cache");
        return productModel!;
      } else {
        response = await dio.get(baseurl);
        productModel = ProductModel.fromMap(response.data);
        print("From Server");
        return productModel!;
      }
    } catch (e) {
      print(productModel);
      return ExceptionModel();
    }
  }
}
