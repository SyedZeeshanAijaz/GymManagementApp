import 'package:flutter/material.dart';
import 'constants.dart';

class CustomIcon extends StatelessWidget {
  final IconData cusIcon;
  final String? cStr;
  const CustomIcon({required this.cusIcon, this.cStr});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cusIcon,
          size: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          cStr.toString(),
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
