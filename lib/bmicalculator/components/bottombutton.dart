import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.str1, @required this.onPress});
  final String? str1;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(
          top: 10,
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            str1.toString(),
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
