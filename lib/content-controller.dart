import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  List list = [].obs;
  List info = [].obs;
  RxBool isLoading = false.obs;

  BuildContext context;
  ContentController(this.context);

  @override
  void onInit() {
    // readData();
    // sleep(const Duration(seconds: 5));
    super.onInit();
  }

  @override
  void onReady() {
    readData();
    super.onReady();
  }

  readData() async {
    try {
      isLoading(true);
      list = await DefaultAssetBundle.of(context)
          .loadString("json/recent.json")
          .then((s) {
        return json.decode(s);
      });

      info = await DefaultAssetBundle.of(context)
          .loadString("json/detail.json")
          .then((s) {
        return json.decode(s);
      });
    } finally {
      isLoading(false);
    }
  }
}
