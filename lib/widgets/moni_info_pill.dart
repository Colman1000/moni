import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/moni_text.dart';

class InfoPill extends StatelessWidget {
  const InfoPill({
    Key? key,
    required this.label,
    required this.value,
    this.color,
  }) : super(key: key);

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(50),
      color: MoniColors.darkDarkest,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          children: [
            MoniText('$label:' , color: MoniColors.greyBase,),
            const SizedBox(width: 5),
            MoniText(value, color: color, bold: true, textType: MoniTextType.body),
          ],
        ),
      ),
    );
  }
}
