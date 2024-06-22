import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_as_state_management/controller/counter_controlller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var counterController = Get.put(CounterControlller());
  var counterObsController = Get.put(CounterObserverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder(
          init: counterController,
          builder: (controller) {
            return Text(controller.counter.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increament();
          Get.find<CounterObserverController>().changeValue(10);
        },
      ),
    );
  }
}

class HomePageWithObservable extends StatelessWidget {
  HomePageWithObservable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            return Text(
              Get.find<CounterObserverController>().counter.string,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterObserverController>().increament();
        },
      ),
    );
  }
}
