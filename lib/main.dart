import 'package:bloc_pattern/bloc/animal_bloc.dart';
import 'package:bloc_pattern/bloc/light_bloc.dart';
import 'package:bloc_pattern/config/bloc_observe.dart';
import 'package:bloc_pattern/counter/counter_event.dart';
import 'package:bloc_pattern/counter/counter_manager.dart';
import 'package:bloc_pattern/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimalPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterManager(),
      child: Builder(builder: (context) {
        return Scaffold(
            body: Center(
              child: BlocBuilder<CounterManager, CounterState>(
                builder: (context, state) {
                  if (state is TheNumberIsAdded) {
                    return Text(state.counter.toString());
                  } else if (state is TherNumberIsSub) {
                    return Text(state.counter.toString());
                  } else {
                    return Text(
                        (state as TheNumberIsZeroNow).counter.toString());
                  }
                },
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    context.read<CounterManager>().add(IncreamentCounter());
                  },
                  child: Icon(Icons.add),
                ),
                InkWell(
                  onTap: () {
                    context.read<CounterManager>().add(RestoreToZero());
                  },
                  child: Icon(Icons.exposure_zero),
                ),
                InkWell(
                    onTap: () {
                      context.read<CounterManager>().add(DecreamenetCounter());
                    },
                    child: Icon(Icons.minimize))
              ],
            ));
      }),
    );
  }
}

class LigthBulbPage extends StatelessWidget {
  const LigthBulbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LightBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocListener<LightBloc, LightState>(
              listener: (context, state) {
                if (state is BrokeLight) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("The Light Has Been Broken")));
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<LightBloc, LightState>(
                      builder: (context, state) {
                        if (state is LightOff) {
                          return Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                            width: 300,
                            height: 300,
                          );
                        } else if (state is LightOn) {
                          return Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                            width: 300,
                            height: 300,
                          );
                        } else if (state is BrokeLight) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                                width: 300,
                                height: 300,
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    InkWell(
                      onTap: () {
                        context.read<LightBloc>().add(ChangeLight());
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "On // Off",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown.shade300),
                        width: 120,
                        height: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimalPage extends StatelessWidget {
  AnimalPage({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalBloc()..add(GetAnimal()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: name,
              ),
            ),
            body: BlocBuilder<AnimalBloc, AnimalState>(
              builder: (context, state) {
                if (state is AnimalListSuccess) {
                  return ListView.builder(
                    itemCount: state.animals.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.animals[index].name),
                    ),
                  );
                } else if (state is ErrorState) {
                  return const Center(
                    child: Text("There is No Internte"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            floatingActionButton: BlocListener<AnimalBloc, AnimalState>(
              listener: (context, state) {
                if (state is SuccessAnimalCreated) {
                  context.read<AnimalBloc>().add(GetAnimal());
                }
              },
              child: FloatingActionButton(onPressed: () {
                context
                    .read<AnimalBloc>()
                    .add(CreateNewAnimal(name: name.text));
              }),
            ),
          );
        },
      ),
    );
  }
}

class AnimalPageWithConsumer extends StatelessWidget {
  AnimalPageWithConsumer({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalBloc()..add(GetAnimal()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: name,
              ),
            ),
            body: BlocConsumer<AnimalBloc, AnimalState>(
              listener: (context, state) {
                if (state is SuccessAnimalCreated) {
                  context.read<AnimalBloc>().add(GetAnimal());
                }
              },
              builder: (context, state) {
                if (state is AnimalListSuccess) {
                  return ListView.builder(
                    itemCount: state.animals.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Image.network(state.animals[index].image),
                      title: Text(state.animals[index].name),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              context.read<AnimalBloc>().add(CreateNewAnimal(name: name.text));
            }),
          );
        },
      ),
    );
  }
}
