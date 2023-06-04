import 'package:flutter/material.dart';

///Callback that notifies when the selection changes.
typedef OnSelectionChanged = void Function(List<int> selectedIndices);

///A generic widget that allows multiple items to be selected.
class CodeSwipeMultiSelector<T> extends StatefulWidget {
  const CodeSwipeMultiSelector._({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.itemBuilder,
    required this.onSelectionChanged,
    this.axis = Axis.horizontal,
    required this.isGrid,
  });

  factory CodeSwipeMultiSelector.grid({
    required List<T> items,
    required List<T> selectedItems,
    required Widget Function(T item) itemBuilder,
    required OnSelectionChanged onSelectionChanged,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) =>
      CodeSwipeMultiSelector._(
        items: items,
        selectedItems: selectedItems,
        itemBuilder: itemBuilder,
        onSelectionChanged: onSelectionChanged,
        isGrid: true,
      );

  factory CodeSwipeMultiSelector.list({
    required List<T> items,
    required List<T> selectedItems,
    required Widget Function(T item) itemBuilder,
    required OnSelectionChanged onSelectionChanged,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    required Axis axis,
  }) =>
      CodeSwipeMultiSelector._(
        items: items,
        selectedItems: selectedItems,
        itemBuilder: itemBuilder,
        onSelectionChanged: onSelectionChanged,
        axis: axis,
        isGrid: false,
      );

  final List<T> items;
  final List<T> selectedItems;
  final Widget Function(T item) itemBuilder;
  final OnSelectionChanged onSelectionChanged;
  final Axis axis;
  final bool isGrid;

  @override
  State<CodeSwipeMultiSelector<T>> createState() =>
      _CodeSwipeMultiSelectorState();
}

class _CodeSwipeMultiSelectorState<T> extends State<CodeSwipeMultiSelector<T>> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
