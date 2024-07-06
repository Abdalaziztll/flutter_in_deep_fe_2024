import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FuturePageWithCache(),
    );
  }
}

class CounterPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      body: Center(
        child: Text("${counter.value}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
      ),
    );
  }
}

class TimerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var timeCounte = useState(0);

    useEffect(() {
      Timer t = Timer.periodic(Duration(seconds: 1), (time) {
        timeCounte.value = time.tick;
      });
    }, []);
    return Scaffold(
      body: Center(
        child: Text(
          timeCounte.value.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class FuturePageWithCache extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var timeCounte = useState(0);
    
    Future<String> getName() async {
      await Future.delayed(Duration(seconds: 1));
      return "Hello World ${timeCounte.value}";
    }

    // ? Make Timer for counter
    useEffect(() {
      Timer t = Timer.periodic(Duration(seconds: 1), (time) {
        timeCounte.value = time.tick;
      });
    }, []);


    // ? use Future to get Async Data ,
    // ? use Memoized to Cache Data ,
    // ! set an Array to observe data that came from Future Function
    final name = useFuture(useMemoized(getName,[timeCounte.value]),) ;
    
    return Scaffold(
      body: Center(
        child: Text(name.hasData ? name.data! : "There Is No Data"),
      ),
    );
  }
}
