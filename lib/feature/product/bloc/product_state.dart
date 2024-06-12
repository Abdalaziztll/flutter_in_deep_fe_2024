// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class SuccessGetProduct extends ProductState {
final  ProductModel productModel;
  SuccessGetProduct({
    required this.productModel,
  });
}

class ErrorToGetProoduct extends ProductState {}

class LoadingToGetProduct extends ProductState {}
