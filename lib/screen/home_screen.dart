//home_screen
import 'package:asymmetri_assignment/mydata/color_controller.dart';
import 'package:asymmetri_assignment/mydata/my_color_model.dart';
import 'package:asymmetri_assignment/mydata/textfield_controller.dart';
import 'package:asymmetri_assignment/widget/sliding_container_list.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ColorController colorController = Get.put(ColorController());
  final TextFieldController textFieldController = Get.put(
    TextFieldController(),
  );

  @override
  Widget build(BuildContext context) {
    final double widgetWidth = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/asymmetri_logo.jpg",
                  height: 80,
                  width: widgetWidth,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: widgetWidth,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => DropdownButtonFormField<Color>(
                    elevation: 20,
                    decoration: const InputDecoration(border: InputBorder.none),
                    value: colorController.selectedColor.value,
                    items: List.generate(
                      MyData().colors.length,
                      (index) => DropdownMenuItem(
                        value: MyData().colors[index].color,
                        child: Text(MyData().colors[index].name),
                      ),
                    ),
                    onChanged: (color) {
                      if (color != null) {
                        colorController.changeColor(color);
                        textFieldController.resetSequence();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Slider
              Obx(
                () => SizedBox(
                  width: widgetWidth,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: colorController.selectedColor.value,
                      inactiveTrackColor: Colors.grey[300],
                      thumbColor: colorController.selectedColor.value,
                      overlayColor: colorController.selectedColor.value
                          .withValues(alpha: 0.2),
                      trackHeight: 4.0,
                    ),
                    child: Slider(
                      value: textFieldController.sliderValue.value,
                      onChanged: textFieldController.updateSliderValue,
                      min: 0.0,
                      max: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => SizedBox(
                  width: widgetWidth,
                  child: TextField(
                    controller: textFieldController.totalItemsController,
                    onChanged: (value) {
                      textFieldController.updateTotalItems(value);
                      textFieldController.resetSequence();
                    },
                    style: TextStyle(
                      color: colorController.selectedColor.value,
                    ),
                    decoration: InputDecoration(
                      labelText: "Total Items",
                      labelStyle: TextStyle(
                        color: colorController.selectedColor.value,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorController.selectedColor.value,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorController.selectedColor.value,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorController.selectedColor.value,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => SizedBox(
                  width: widgetWidth,
                  child: TextField(
                    controller: textFieldController.itemsInLineController,
                    onChanged: (value) {
                      textFieldController.updateItemsInLine(value);
                      textFieldController.resetSequence();
                    },
                    style: TextStyle(
                      color: colorController.selectedColor.value,
                    ),
                    decoration: InputDecoration(
                      labelText: "Items In Line",
                      labelStyle: TextStyle(
                        color: colorController.selectedColor.value,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorController.selectedColor.value,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorController.selectedColor.value,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorController.selectedColor.value,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Reverse",
                        style: TextStyle(
                          color: colorController.selectedColor.value,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      CupertinoSwitch(
                        activeTrackColor: colorController.selectedColor.value
                            .withValues(alpha: 0.5),
                        value: textFieldController.isReverse.value,
                        onChanged: (value) {
                          textFieldController.toggleReverse();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => SlidingContainerList(
                  isExpanded: textFieldController.bothFieldsHaveInput,
                  onToggle: () {},
                  selectedColor: colorController.selectedColor.value,
                  totalItems: textFieldController.totalItems,
                  itemsInLine: textFieldController.itemsInLine == 0
                      ? 1
                      : textFieldController.itemsInLine,
                  sliderValue: textFieldController.sliderValue.value,
                  isReverse: textFieldController.isReverse.value,
                  currentAnimatingIndex:
                      textFieldController.currentAnimatingIndex.value,
                  completedAnimations: textFieldController.completedAnimations,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
