import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/config/constants.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:moni/utils/helpers.dart';
import 'package:provider/provider.dart';
import 'package:moni/widgets/buttons/moni_filled_button.dart';
import 'package:moni/widgets/moni_avatar.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_info_pill.dart';
import 'package:moni/widgets/moni_text.dart';

class HomeHeaderBar extends StatelessWidget {
  const HomeHeaderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _clusterModel = context.watch<ClusterModel>();
    final _clusterDetail = _clusterModel.detail;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Constants.backgroundImage), fit: BoxFit.cover),
      ),
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
                children: [
                  MoniText(
                    _clusterDetail.name,
                    textType: MoniTextType.body,
                    color: MoniColors.light,
                    bold: true,
                  ),
                  const SizedBox(height: 10),
                  InfoPill(
                    label: "Repayment rate",
                    value: _clusterDetail.repaymentPercentage,
                    color: MoniColors.secondaryDarkest,
                  ),
                  const SizedBox(height: 5),
                  InfoPill(
                    label: "Repayment Day",
                    value: _clusterDetail.repaymentDayString,
                    color: MoniColors.greenLighter,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              const Spacer(),
              const MoniAvatar(
                name: "Stan",
                imageUrl:
                    "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1570295999919-56ceb5ecca61",
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
                children: [
                  const MoniText(
                    "Cluster purse balance",
                    textType: MoniTextType.tiny,
                    color: MoniColors.light,
                  ),
                  const SizedBox(height: 5),
                  MoniText(
                    _clusterDetail.formattedPurseBalance,
                    textType: MoniTextType.header,
                    color: MoniColors.light,
                    bold: true,
                  ),
                  const SizedBox(height: 5),
                  MoniText(
                    "+ ${Format.toCurrency(_clusterDetail.totalInterestEarned)} interest today",
                    textType: MoniTextType.tiny,
                    color: MoniColors.greenLighter,
                  ),
                ],
              ),
              const Spacer(),
              MoniFilledButton(
                "View Purse",
                onPressed: _clusterModel.viewPurse,
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
            children: [
              const MoniText(
                "Total interest earned",
                color: MoniColors.greyBase,
              ),
              const Spacer(),
              MoniText(
                _clusterDetail.formattedTotalInterest,
                color: MoniColors.secondaryBase,
              ),
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
            children: [
              const MoniText(
                "Total owed by members",
                color: MoniColors.greyBase,
              ),
              const Spacer(),
              MoniText(
                _clusterDetail.formattedTotalOwed,
                color: MoniColors.light,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
