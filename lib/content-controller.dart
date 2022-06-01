import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  var list = [].obs;
  var info = [].obs;
  var isLoading = false.obs;
  
  BuildContext context;
  ContentController(this.context);

  @override
  void onInit() {
    readData().then((v){
       print(v.toString());
    });
    super.onInit();
  }

  readData() async {
    try {
      isLoading = true.obs;
      await DefaultAssetBundle.of(context)
          .loadString("json/recent.json")
          .then((s) {
        list = json.decode(s);
      });
      await DefaultAssetBundle.of(context)
          .loadString("json/detail.json")
          .then((s) {
        info = json.decode(s);
      });
      update();
    } catch (e) {
      isLoading = false.obs;
    }
  }
}
