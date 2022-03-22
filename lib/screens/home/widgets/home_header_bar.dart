import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/buttons/moni_filled_button.dart';
import 'package:moni/widgets/moni_avatar.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_info_pill.dart';
import 'package:moni/widgets/moni_text.dart';

class HomeHeaderBar extends StatelessWidget {
  const HomeHeaderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MoniColors.backgroundDark,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        children: [
          const MoniText(
            "My cluster",
            align: TextAlign.center,
            textType: MoniTextType.header,
            weight: FontWeight.w700,
            color: MoniColors.light,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MoniText(
                    "Moni dreambig community",
                    textType: MoniTextType.body,
                    color: MoniColors.light,
                    bold: true,
                  ),
                  SizedBox(height: 10),
                  InfoPill(
                      label: "Repayment rate",
                      value: "60%",
                      color: MoniColors.secondaryDarkest),
                  SizedBox(height: 5),
                  InfoPill(
                    label: "Repayment Day",
                    value: "Every Sunday",
                    color: MoniColors.greenLighter,
                  ),
                  SizedBox(height: 5),
                ],
              ),
              const Spacer(),
              const MoniAvatar(
                "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1633332755192-727a05c4013d",
              )
            ],
          ),
          const SizedBox(height: 5),
          MoniDivider(
            space: 5,
            color: MoniColors.greyDark.withOpacity(0.2),
            thickness: 1.5,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MoniText(
                    "Cluster purse balance",
                    textType: MoniTextType.tiny,
                    color: MoniColors.light,
                  ),
                  SizedBox(height: 5),
                  MoniText(
                    "N550,000,000",
                    textType: MoniTextType.header,
                    color: MoniColors.light,
                    bold: true,
                  ),
                  SizedBox(height: 5),
                  MoniText(
                    "+ N550,000,000 interest today",
                    textType: MoniTextType.tiny,
                    color: MoniColors.greenLighter,
                  ),
                ],
              ),
              const Spacer(),
              MoniFilledButton(
                "View Purse",
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 10),
          MoniDivider(
            space: 5,
            color: MoniColors.greyDark.withOpacity(0.2),
            thickness: 1.5,
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              MoniText("Total interest earned", color: MoniColors.greyBase),
              Spacer(),
              MoniText("N550,000,000", color: MoniColors.secondaryBase),
            ],
          ),
          const SizedBox(height: 10),
          MoniDivider(
            space: 5,
            color: MoniColors.greyDark.withOpacity(0.2),
            thickness: 1.5,
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              MoniText("Total owned by members", color: MoniColors.greyBase),
              Spacer(),
              MoniText("N550,000,000", color: MoniColors.light),
            ],
          ),
        ],
      ),
    );
  }
}
