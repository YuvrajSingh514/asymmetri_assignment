import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  var selectedColor = (Colors.green as Color).obs;

  void changeColor(Color color) {
    selectedColor.value = color;
  }
}
