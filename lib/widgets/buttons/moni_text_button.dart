import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/moni_text.dart';

class MoniTextButton extends StatelessWidget {
  const MoniTextButton(
    this.label, {
    Key? key,
    this.onPressed,
    this.color,
    this.icon,
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14),
            const SizedBox(width: 10),
          ],
          MoniText(
            label,
            color:
                onPressed != null ? MoniColors.primaryBase : MoniColors.muted,
            textType: MoniTextType.subtitle,
            weight: FontWeight.w400,
          ),
        ],
      ),
      style: TextButton.styleFrom(
        primary: color ?? MoniColors.primaryBase,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      ),
    );
  }
}
