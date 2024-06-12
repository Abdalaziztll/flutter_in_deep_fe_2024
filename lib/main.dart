import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_in_deep/bloc/counter_bloc.dart';
import 'package:flutter_bloc_in_deep/feature/product/view/product_page.dart';

// class A {
//   List<String> names = [];
// }

void main() {
  // A a = A();

  // a.names.add("Hello");

  // A b = A();

  // print(b.names);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: InkWell(
              onTap: () {
                context.read<CounterBloc>().add(Add());
              },
              child: Icon(Icons.face),
            ),
          ),
          body: Center(
            child: InkWell(
              onTap: () {
                // ! Test BlocProvider by Value
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => BlocProvider.value(
                //         value: context.read<CounterBloc>(),
                //         child: SecondPage(),
                //       ),
                //     ));

                // ! Test Caching Page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<CounterBloc>(),
                        child: ProductPage(),
                      ),
                    ));
              },
              child: Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: InkWell(
            onTap: () {
              context.read<CounterBloc>().add(Add());
            },
            child: Icon(Icons.help),
          ),
        ),
      );
    });
  }
}
