import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/bloc/auth_bloc.dart';
import 'package:intro_to_bloc/model/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  TextEditingController email = TextEditingController();

  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: email,
              ),
              TextField(
                controller: firstName,
              ),
              TextField(
                controller: lastName,
              ),
              TextField(
                controller: password,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is SuccessInSignUp) {
                    return Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(Icons.verified),
                      ),
                    );
                  }
                  if (state is ExceptioInSignUp) {
                    return Text("No <:");
                  }
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            SignUp(
                              user: UserModel(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  password: password.text,
                                  email: email.text,
                                  role: "USER"),
                            ),
                          );
                    },
                    child: Text("data"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      maximumSize: Size(400, 200),
                      // textStyle: ,
                      foregroundColor: Colors.yellow,
                      surfaceTintColor: Colors.blue,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
