import 'package:flutter/material.dart';
import 'package:moni/widgets/moni_text.dart';

class ClusterDetailHeader extends StatelessWidget {
  const ClusterDetailHeader({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 25,
        width: 25,
        child: icon,
      ),
      title: MoniText(
        label,
        textType: MoniTextType.large,
        weight: FontWeight.w700,
      ),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
    );
  }
}