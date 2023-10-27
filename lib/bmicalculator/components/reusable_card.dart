import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({@required this.colour, this.cardChild, this.onPress});
  final Color? colour;
  final Widget? cardChild;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
