import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getx_as_state_management/model/cat_model.dart';
import 'package:getx_as_state_management/view/error_page.dart';
import 'package:getx_as_state_management/view/home_pgae.dart';

class CounterControlller extends GetxController {
  int counter = 0;

  increament() {
    counter++;
    update();
    if (counter > 2) {
      Get.to(HomePageWithObservable());
    } else {
      Get.showSnackbar(GetSnackBar(
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        message: 'Hello World',
      ));
    }
  }
}

class CounterObserverController extends GetxController {
  RxInt counter = 0.obs;

  increament() {
    counter.value++;
  }

  changeValue(int newCounter) {
    counter.value = newCounter;
  }
}

class CatApi extends GetxController {
  Rx<ResutlModel> cat = ResutlModel().obs;

  getCat() async {
    try {
      var response = await GetConnect().get(
        "https://freetestapi.com/api/v1/cats/1",
      );
      print(response.body);
      if (response.statusCode == 200) {
        cat.value = CatModel.fromJson(response.body);
      } else {
        if (response.body == null) {
          Get.showSnackbar(GetSnackBar(
        message: 'There is No internte',
        backgroundColor: Colors.red,
      ));
        }
        
        cat.value = ErrorModel();
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: 'There is No internte',
        backgroundColor: Colors.red,
      ));
    }
  }
}
