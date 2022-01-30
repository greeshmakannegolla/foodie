import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';

class IncrementDecrement extends StatefulWidget {
  const IncrementDecrement(
      {this.initialValue = 0, required this.onChanged, Key? key})
      : super(key: key);

  final int initialValue;
  final Function(int) onChanged;

  @override
  _IncrementDecrementState createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    //Widget to display the increment/decrement counter during "Add to cart" workflow
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_rounded,
            color: ColorConstants.textPrimaryColor.withOpacity(0.9),
          ),
          onPressed: () => setState(() {
            if (_itemCount != 0) {
              _itemCount--;
              widget.onChanged(_itemCount);
            }
          }),
        ),
        Text(
          _itemCount.toString(),
          style: kSecondaryHeader.copyWith(
              color: ColorConstants.textPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        IconButton(
            icon: Icon(
              Icons.add_rounded,
              color: ColorConstants.textPrimaryColor.withOpacity(0.9),
            ),
            onPressed: () => setState(() {
                  _itemCount++;
                  widget.onChanged(_itemCount);
                }))
      ],
    );
  }
}
