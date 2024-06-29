import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  List<String> names = ["Noor", "yara", "Hala", "Dania", "Maya"];

  List<String> jops = ["Noor", "yara", "Hala", "Dania", "Maya"];

  List<Widget> items = [];

  GlobalKey<AnimatedListState> key = GlobalKey();

  Future future = Future(() {});

  buildItems(List<String> names, List<String> jops) {
    for (var i = 0; i < names.length; i++) {
      future = future.then((_)async {
     await   Future.delayed(
          Duration(milliseconds: 300),
          () {
            items.add(buildListTile(names[i], jops[i]));
            key.currentState!.insertItem(i);
          },
        );
      });
    }
  }

  Widget buildListTile(String name, String subtitle) {
    return ListTile(
      title: Text(name),
      subtitle: Text(subtitle),
    );
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      buildItems(names, jops);
    // });
  }

  Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedList(
      key: key,
      initialItemCount: items.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(offset),
          child: items[index],
        );
      },
    ));
  }
}
