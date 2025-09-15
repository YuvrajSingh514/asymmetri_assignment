import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextFieldController extends GetxController {
  final TextEditingController totalItemsController = TextEditingController();
  final TextEditingController itemsInLineController = TextEditingController();

  var totalItemsText = '1'.obs;
  var itemsInLineText = '1'.obs;
  var sliderValue = 0.3.obs;
  var isReverse = false.obs;
  // Drives sequential bar animation
  var currentAnimatingIndex = 0.obs;
  // Track which items have completed their animation
  var completedAnimations = <int>[].obs;

  bool get bothFieldsHaveInput =>
      totalItemsText.value.isNotEmpty && itemsInLineText.value.isNotEmpty;

  int get totalItems => int.tryParse(totalItemsText.value) ?? 1;
  int get itemsInLine => int.tryParse(itemsInLineText.value) ?? 1;

  void updateTotalItems(String value) {
    totalItemsText.value = value;
    currentAnimatingIndex.value = 0;
    completedAnimations.clear();
  }

  void updateItemsInLine(String value) {
    itemsInLineText.value = value;
    currentAnimatingIndex.value = 0;
    completedAnimations.clear();
  }

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  void toggleReverse() {
    resetSequence();
    isReverse.value = !isReverse.value;
  }

  void resetSequence() {
    currentAnimatingIndex.value = 0;
    completedAnimations.clear();
  }

  void advanceSequence(int totalItems) {
    // Mark current animation as completed
    completedAnimations.add(currentAnimatingIndex.value);

    if (currentAnimatingIndex.value < totalItems - 1) {
      currentAnimatingIndex.value++;
    }
  }

  @override
  void onClose() {
    totalItemsController.dispose();
    itemsInLineController.dispose();
    super.onClose();
  }
}
