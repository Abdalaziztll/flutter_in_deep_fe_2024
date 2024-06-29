
import 'package:flutter/material.dart';

class SimpleImplicitAnimation extends StatefulWidget {
  const SimpleImplicitAnimation({super.key});

  @override
  State<SimpleImplicitAnimation> createState() =>
      _SimpleImplicitAnimationState();
}

class _SimpleImplicitAnimationState extends State<SimpleImplicitAnimation> {
  double height = 100;
  double width = 100;
  Color color = Colors.red;
  double margin = 20;
  bool isVisiable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              // height += 50;
              // width += 50;
              // color = Colors.yellow;
              // margin += 20;

              // ? To Show the visiablity
              // isVisiable = !isVisiable;

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SimpleTweenExample();
                },
              ));
            });
          },
          child: Visibility(
            replacement: FlutterLogo(),
            visible: isVisiable,
            child: Hero(
              tag: 'static',
              child: AnimatedContainer(
                child: Text("data"),
                margin: EdgeInsets.only(left: margin),
                padding: EdgeInsets.only(left: margin),
                color: color,
                width: height,
                height: width,
                duration: Duration(seconds: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleTweenExample extends StatelessWidget {
  const SimpleTweenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: 'static',
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
          TweenAnimationBuilder(
            child: Text("Hello World"),
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 3),
            builder: (context, value, child) {
              print(value);
              return Padding(
                padding: EdgeInsets.only(left: value * 20, top: value * 20),
                child: Opacity(opacity: value, child: child),
              );
            },
          ),
        ],
      ),
    );
  }
}

