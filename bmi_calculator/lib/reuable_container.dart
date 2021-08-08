import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.custom_color, required this.cardChld});
  final Color custom_color;
  final Widget cardChld;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChld,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: custom_color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
