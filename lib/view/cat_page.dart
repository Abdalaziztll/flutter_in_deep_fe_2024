import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_as_state_management/controller/counter_controlller.dart';
import 'package:getx_as_state_management/model/cat_model.dart';

class CatPage extends StatelessWidget {
  CatPage({super.key});

  var catapi = Get.put(CatApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: Text(
            (Get.find<CatApi>().cat.value is CatModel)
                ? (Get.find<CatApi>().cat.value as CatModel).name!
                : "No Data Yet",
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CatApi>().getCat();
        },
      ),
    );
  }
}
