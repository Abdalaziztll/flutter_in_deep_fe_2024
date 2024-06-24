import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_intro/model/cat_model.dart';
import 'package:riverpod_intro/provider/async_data_provider.dart';
import 'package:riverpod_intro/provider/check_connection.dart';
import 'package:riverpod_intro/provider/simple_counter_with_delay.dart';
import 'package:riverpod_intro/provider/string_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Consumer(builder: (context, ref, _) {
          return ref.watch(checkInternet).when(
            data: (data) {
              if (data.first == ConnectivityResult.wifi) {
                return CatPage();
              } else {
                return ImmutabelPage();
              }
            },
            error: (error, stackTrace) {
              return Text("There is An Issue");
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class ImmutabelPage extends StatelessWidget {
  const ImmutabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final uiName = ref.watch(name);
            return Text(uiName);
          },
        ),
      ),
    );
  }
}

class StatePage extends ConsumerWidget {
  const StatePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counterFromProvider = ref.watch(counter);
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              ref.invalidate(counter);
            },
            icon: Icon(Icons.refresh)),
      ),
      body: Center(
        child: Text(
          counterFromProvider.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
      ),
    );
  }
}

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          return ref.watch(catData).when(
            data: (data) {
              return ListView.builder(
                itemCount: (data as ListOf<CatModel>).resutlAsList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(data.resutlAsList[index].name),
                ),
              );
            },
            error: (error, stackTrace) {
              return Text("There is An Error");
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}

class CountyUiExample extends StatelessWidget {
  const CountyUiExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return ref.watch(countyToViewInUi).when(
            data: (data) {
              return Text(data.toString());
            },
            error: (error, stackTrace) {
              return Text("There is An Isuue");
            },
            loading: () {
              return CircularProgressIndicator();
            },
          );
        }),
      ),
    );
  }
}
