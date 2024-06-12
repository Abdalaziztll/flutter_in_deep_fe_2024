import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_in_deep/feature/product/bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetOneProduct()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              switch (state) {
                case LoadingToGetProduct():
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ErrorToGetProoduct():
                  return Text("There is no internet");
                default:
                  return Column(
                    children: [
                      Image.network(
                          (state as SuccessGetProduct).productModel.image),
                      ListTile(
                        title: Text(state.productModel.name),
                        subtitle: Text(state.productModel.brand),
                      )
                    ],
                  );
              }
            },
          ),
        );
      }),
    );
  }
}
