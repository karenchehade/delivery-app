import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;
  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar("loved it", "you aLrEADY loved it");
    } else {
      fav.value++;
      Get.snackbar('love it', 'you just loved it');
    }
  }
}
