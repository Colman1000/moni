import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/moni_avatar.dart';
import 'package:moni/widgets/moni_text.dart';

class MoniLoanTile extends StatelessWidget {
  const MoniLoanTile({
    Key? key,
    required this.user,
    this.userImageUrl,
    this.subtitle,
    this.time,
    this.timeColor,
    this.subtitleColor,
  }) : super(key: key);

  final String? userImageUrl;
  final String user;
  final String? subtitle;
  final String? time;
  final Color? timeColor;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MoniAvatar(
        name: user,
        imageUrl: userImageUrl,
        size: 40,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MoniText(
            user,
            textType: MoniTextType.subtitle,
            color: MoniColors.dark,
            bold: true,
          ),
          if (time != null && time!.isNotEmpty) ...[
            Container(
              height: 5,
              width: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: MoniColors.muted,
                  borderRadius: BorderRadius.circular(10)),
            ),
            MoniText(
              time!,
              textType: MoniTextType.subtitle,
              color: timeColor,
              weight: FontWeight.w400,
            ),
          ]
        ],
      ),
      subtitle: MoniText(
        (subtitle?.isNotEmpty ?? false) ? subtitle! : "No active loan",
        textType: MoniTextType.subtitle,
        color: subtitleColor,
        weight:
            (subtitle?.isNotEmpty ?? false) ? FontWeight.w700 : FontWeight.w300,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
