import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/moni_text.dart';

class MoniFilledButton extends StatelessWidget {
  const MoniFilledButton(this.label, {Key? key, this.onPressed, this.color})
      : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: MoniText(
        label,
        color: MoniColors.light,
        weight: FontWeight.w300,
        textType: MoniTextType.subtitle,
      ),
      style: ElevatedButton.styleFrom(
        primary: color ?? MoniColors.primaryBase,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24)
      ),
    );
  }
}
