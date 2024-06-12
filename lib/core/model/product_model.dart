// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_bloc_in_deep/core/model/handling.dart';

class ProductModel extends ResultModel {
  String name;
  String description;
  num price;
  String image;
  String brand;
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.brand,
  });

  ProductModel copyWith({
    String? name,
    String? description,
    num? price,
    String? image,
    String? brand,
  }) {
    return ProductModel(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'brand': brand,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      image: map['image'] as String,
      brand: map['brand'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, description: $description, price: $price, image: $image, brand: $brand)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.image == image &&
      other.brand == brand;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      image.hashCode ^
      brand.hashCode;
  }
}
