import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  List list = [].obs;
  List info = [].obs;
  bool isLoading = false;

  BuildContext context;
  ContentController(this.context);

  @override
  void onInit() {
    print('$isLoading abel read data');
    Future.delayed(const Duration(seconds: 500), () {
      readData();
      isLoading = false;
      update();
    });

    print('$isLoading on init');
    super.onInit();
  }

  readData() async {
    try {
      isLoading = true;
      update();
      print('$isLoading awal');
      await DefaultAssetBundle.of(context)
          .loadString("json/recent.json")
          .then((s) {
        list = json.decode(s);
      });
      await DefaultAssetBundle.of(context)
          .loadString("json/detail.json")
          .then((s) {
        // isLoading = true.obs;
        info = json.decode(s);
      });
      isLoading = false;
      update();
      print('$isLoading final');
    } catch (e) {
      isLoading = false;
    }
  }
}
