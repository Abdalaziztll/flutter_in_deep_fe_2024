import 'package:flutter/material.dart';
import 'package:my_app/view/animated/implicit/implicit_example.dart';
import 'package:page_transition/page_transition.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation color;
  late Animation size;
  late Animation fancy_size;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    size = Tween<double>(begin: 30, end: 80).animate(controller);
    fancy_size = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 25, end: 50), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 50, end: 40), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 40, end: 50), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 50, end: 25), weight: 10),
    ]).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: Duration(seconds: 2),
                  type: PageTransitionType.leftToRight,
                  child: SimpleTweenExample()));
        },
        trailing: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return IconButton(
                onPressed: () {
                  controller.forward();
                },
                icon: Icon(
                  size: fancy_size.value,
                  Icons.favorite,
                  color: color.value,
                ),
              );
            }),
        title: Text("Hell Wolrd"),
        subtitle: Text("Ex non nisi pariatur incididunt sunt ullamco."),
      ),
    );
  }
}
