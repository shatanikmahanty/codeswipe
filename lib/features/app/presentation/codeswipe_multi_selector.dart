import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

///Callback that notifies when the selection changes.
typedef OnSelectionChanged<T> = void Function(List<T> selectedItems);
typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);

///A generic widget that allows multiple items to be selected.
class CodeSwipeMultiSelector<T> extends StatefulWidget {
  const CodeSwipeMultiSelector._({
    super.key,
    required this.items,
    required this.initialSelections,
    this.itemBuilder,
    required this.onSelectionChanged,
    this.axis = Axis.horizontal,
  });

  factory CodeSwipeMultiSelector.grid({
    required List<T> items,
    required List<T> initialSelections,
    ItemBuilder<T>? itemBuilder,
    required OnSelectionChanged<T> onSelectionChanged,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) =>
      CodeSwipeMultiSelector._(
        items: items,
        initialSelections: initialSelections,
        itemBuilder: itemBuilder,
        onSelectionChanged: onSelectionChanged,
      );

  final List<T> items;
  final List<T> initialSelections;
  final ItemBuilder<T>? itemBuilder;
  final ValueChanged<List<T>> onSelectionChanged;
  final Axis axis;

  @override
  State<CodeSwipeMultiSelector<T>> createState() =>
      _CodeSwipeMultiSelectorState();
}

class _CodeSwipeMultiSelectorState<T> extends State<CodeSwipeMultiSelector<T>> {
  List<T> _selectedItems = [];

  @override
  void initState() {
    _selectedItems = List.from(widget.initialSelections);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: kPadding * 2),
      itemCount: widget.items.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kPadding * 2,
        crossAxisSpacing: kPadding * 2,
        childAspectRatio: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        final itemBuilder = widget.itemBuilder;
        if (itemBuilder != null) {
          return itemBuilder(context, widget.items[index]);
        }

        final item = widget.items[index];
        final isSelected = _selectedItems.contains(item);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                _selectedItems.remove(item);
              } else {
                _selectedItems.add(item);
              }
            });
            widget.onSelectionChanged(_selectedItems);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(kButtonRadius),
              border: Border.all(
                color: isSelected ? primaryColor : Colors.grey.shade300,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(
                          0,
                          kPadding,
                        ),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                item.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
