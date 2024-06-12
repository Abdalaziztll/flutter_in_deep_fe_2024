part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}


class GetOneProduct extends ProductEvent {}