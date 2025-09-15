//my_container

import 'package:asymmetri_assignment/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class SlidingContainerList extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback? onToggle;
  final Color selectedColor;
  final int totalItems;
  final int itemsInLine;
  final double sliderValue;
  final bool isReverse;
  final int currentAnimatingIndex;
  final List<int> completedAnimations;

  const SlidingContainerList({
    super.key,
    required this.isExpanded,
    this.onToggle,
    required this.selectedColor,
    required this.totalItems,
    required this.itemsInLine,
    required this.sliderValue,
    required this.isReverse,
    required this.currentAnimatingIndex,
    required this.completedAnimations,
  });

  @override
  Widget build(BuildContext context) {
    if (!isExpanded || totalItems <= 0) {
      return const SizedBox.shrink();
    }
    if (totalItems < itemsInLine) {
      return const SizedBox.shrink();
    }

    int columnCount = (totalItems / itemsInLine).floor();
    int leftContainerCount = totalItems % itemsInLine;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ...List.generate(
            columnCount,
            (columnIndex) => Row(
              children: [
                ...List.generate(
                  itemsInLine,
                  (rowIndex) => ProgressBar(
                    sliderValue: sliderValue,
                    completedAnimations: completedAnimations,
                    selectedColor: selectedColor,
                    currentAnimatingIndex: currentAnimatingIndex,
                    totalItems: totalItems,
                    isReverse: isReverse,
                    itemIndex: columnIndex * itemsInLine + rowIndex,
                  ),
                ),
              ],
            ),
          ),
          if (leftContainerCount > 0)
            Row(
              children: List.generate(
                leftContainerCount + (itemsInLine - leftContainerCount),
                (leftContainerIndex) => leftContainerIndex < leftContainerCount
                    ? ProgressBar(
                        sliderValue: sliderValue,
                        completedAnimations: completedAnimations,
                        selectedColor: selectedColor,
                        currentAnimatingIndex: currentAnimatingIndex,
                        totalItems: totalItems,
                        isReverse: isReverse,
                        itemIndex:
                            columnCount * itemsInLine + leftContainerIndex,
                      )
                    : Expanded(child: SizedBox(width: 1, height: 0)),
              ),
            ),
        ],
      ),
    );
  }
}
