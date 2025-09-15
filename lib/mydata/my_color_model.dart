import 'package:flutter/material.dart';

class MyColorModel {
  final Color color;
  final String name;

  MyColorModel({required this.color, required this.name});
}

class MyData {
  final List<MyColorModel> colors = [
    MyColorModel(color: Colors.blue, name: "Blue"),
    MyColorModel(color: Colors.red, name: "Red"),
    MyColorModel(color: Colors.green, name: "Green"),
    MyColorModel(color: Colors.purple, name: "Purple"),
  ];
}
