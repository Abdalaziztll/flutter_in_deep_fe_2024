import 'package:flutter/material.dart';
import 'package:my_app/view/animated/explicit/explicit_example.dart';
import 'package:my_app/view/animated/implicit/implicit_example.dart';
import 'package:my_app/view/animated/mix/mix_example.dart';
import 'package:my_app/view/animation_list/animated_list_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedListExample(),
    );
  }
}
