import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_in_deep/core/model/handling.dart';
import 'package:flutter_bloc_in_deep/core/model/product_model.dart';
import 'package:flutter_bloc_in_deep/core/service/product_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

ProductServiceImp service = ProductServiceImp();
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(LoadingToGetProduct()) {
    on<GetOneProduct>((event, emit) async {
      emit(LoadingToGetProduct());
      ResultModel result = await service.getOneProduct();
      if (result is ProductModel) {
        emit(SuccessGetProduct(productModel: result));
      } else {
        emit(ErrorToGetProoduct());
      }
    });
  }
}
