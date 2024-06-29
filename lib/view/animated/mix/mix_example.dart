import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:my_app/view/animated/mix/mix_style.dart';

class MixPage extends StatelessWidget {
  const MixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PressableBox(
          onPress: () => {

          },
          child: Box(
            style: style
          ),
        ),
      ),
    );
  }
}
