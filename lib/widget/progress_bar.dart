import 'package:asymmetri_assignment/mydata/textfield_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.sliderValue,
    required this.completedAnimations,
    required this.selectedColor,
    required this.currentAnimatingIndex,
    required this.totalItems,
    required this.isReverse,
    required this.itemIndex,
  });

  final double sliderValue;
  final List<int> completedAnimations;
  final Color selectedColor;
  final int currentAnimatingIndex;
  final int totalItems;
  final bool isReverse;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final int durationMs = (2500 - (sliderValue.clamp(0.0, 1.0) * 2000))
        .toInt();

    // Determine if this item has already been animated (completed)
    final bool isAlreadyAnimated = completedAnimations.contains(itemIndex);
    final Color? backgroundColor = isAlreadyAnimated ? null : Colors.white;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 20,
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: isAlreadyAnimated
              ? LinearGradient(colors: [selectedColor, Colors.black])
              : null,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Stack(
          children: [
            // Background (white or black based on animation state)
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                gradient: isAlreadyAnimated
                    ? LinearGradient(colors: [selectedColor, Colors.black])
                    : null,
              ),
            ),
            // Filled portion with animated gradient from selected color to black
            TweenAnimationBuilder<double>(
              key: ValueKey(
                'seq_${currentAnimatingIndex}_${itemIndex}_$durationMs',
              ),
              tween: Tween<double>(
                begin: 0.0,
                end: currentAnimatingIndex == itemIndex ? 1.0 : 0.0,
              ),
              duration: Duration(milliseconds: durationMs),
              curve: Curves.easeInOut,
              onEnd: () {
                if (currentAnimatingIndex == itemIndex) {
                  try {
                    final controller = Get.find<TextFieldController>();
                    controller.advanceSequence(totalItems);
                  } catch (e) {}
                }
              },
              builder: (context, value, child) {
                final Widget bar = Container(
                  width: MediaQuery.sizeOf(context).width * value,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [selectedColor, Colors.black],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                );

                return Align(
                  alignment: isReverse
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: bar,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
