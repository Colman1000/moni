import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';

class MoniDivider extends StatelessWidget {
  const MoniDivider({
    Key? key,
    this.height = 4,
    this.space = 30,
    this.thickness = 1,
    this.color = MoniColors.grey,
  }) : super(key: key);

  final double height;
  final double space;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      indent: space,
      endIndent: space,
      height: height,
      thickness: thickness,
    );
  }
}
