import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/colorConstants.dart';
import 'package:milkman_assessment/helpers/styleConstants.dart';

class IncrementDecrement extends StatefulWidget {
  const IncrementDecrement({Key? key}) : super(key: key);

  @override
  _IncrementDecrementState createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
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
            }
          }),
        ),
        Text(
          _itemCount.toString(),
          style: kSecondaryHeader.copyWith(
              color: ColorConstants.textPrimaryColor, fontSize: 18),
        ),
        IconButton(
            icon: Icon(
              Icons.add_rounded,
              color: ColorConstants.textPrimaryColor.withOpacity(0.9),
            ),
            onPressed: () => setState(() => _itemCount++))
      ],
    );
  }
}
