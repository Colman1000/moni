import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:moni/screens/home/widgets/cluster_detail_header.dart';
import 'package:moni/utils/helpers.dart';
import 'package:moni/widgets/buttons/moni_text_button.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_text.dart';
import 'package:moni/widgets/moni_text_list.dart';
import 'package:provider/provider.dart';

class ClusterDetailView extends StatelessWidget {
  const ClusterDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _clusterModel = context.watch<ClusterModel>();
    final _clusterDetail = _clusterModel.detail;

    return Material(
      color: MoniColors.light,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const ClusterDetailHeader(
                    label: "Cluster purse settings",
                    icon: CircleAvatar(
                      radius: 20,
                      child: MoniText(
                        "₦",
                        bold: true,
                        textType: MoniTextType.subtitle,
                      ),
                      backgroundColor: MoniColors.grey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MoniText(
                            "Frequency of contribution",
                            weight: FontWeight.w300,
                          ),
                          const SizedBox(height: 10),
                          const MoniText("Monthly Upfront",
                              weight: FontWeight.w400),
                          const SizedBox(height: 10),
                          MoniText(
                            Format.toCurrency(550000000),
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      const Spacer(),
                      MoniTextButton(
                        "Change",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const MoniText(
                    "Your contribution is 8% of your eligible amount ",
                    textType: MoniTextType.subtitle,
                    weight: FontWeight.normal,
                  ),
                  const SizedBox(height: 10),
                  const MoniDivider()
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const ClusterDetailHeader(
                    label: "Group invite Link/Code",
                    icon: FaIcon(FontAwesomeIcons.link, size: 16),
                  ),
                  const MoniText(
                    "Use the link or code below to invite new member",
                    weight: FontWeight.w300,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 10),
                          MoniText("Member invite code",
                              weight: FontWeight.w400),
                          SizedBox(height: 10),
                          MoniText(
                            "30DF38TG000",
                            selectable: true,
                            textType: MoniTextType.header,
                          ),
                        ],
                      ),
                      const Spacer(),
                      MoniTextButton(
                        "Get new code",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const MoniDivider()
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const ClusterDetailHeader(
                    label: "Loan settings",
                    icon: FaIcon(FontAwesomeIcons.listCheck, size: 16),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MoniText(
                            "Total loan collected by cluster",
                            weight: FontWeight.w400,
                            textType: MoniTextType.subtitle,
                          ),
                          const SizedBox(height: 5),
                          MoniText(
                            Format.toCurrency(550000000),
                            weight: FontWeight.w700,
                          ),
                          const SizedBox(height: 10),
                          const MoniText(
                            "Repayment day",
                            weight: FontWeight.w400,
                            textType: MoniTextType.subtitle,
                          ),
                          const SizedBox(height: 5),
                          MoniText(_clusterDetail.repaymentDayString,
                              weight: FontWeight.w700),
                        ],
                      ),
                      const Spacer(),
                      MoniTextButton(
                        "Change",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const MoniDivider()
                ],
              ),
            ),
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  ClusterDetailHeader(
                    label: "Pending Join Request",
                    icon: FaIcon(FontAwesomeIcons.listCheck, size: 16),
                  ),
                  MoniText(
                    "No pending cluster join request",
                    weight: FontWeight.w300,
                  ),
                  SizedBox(height: 10),
                  MoniDivider()
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const ClusterDetailHeader(
                    label: "Group Settings",
                    icon: Icon(Icons.settings),
                  ),
                  const MoniText(
                    "Group rules",
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(height: 10),
                  const MoniTextList(
                    [
                      "Check the car’s rental terms as well, because each company has its own rules",
                      "Check the car’s rental terms as well, because each company has its own rules."
                    ],
                    showNumbering: true,
                  ),
                  const SizedBox(height: 10),
                  const MoniText(
                    "Group Whatsapp",
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(height: 10),
                  const MoniText(
                    "https://chat.whatsapp.com/BmK1mYu9zGAGhhqi8xqQQ5",
                    color: MoniColors.greenDarkest,
                    textType: MoniTextType.subtitle,
                    selectable: true,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    child: MoniTextButton(
                      "Edit Settings",
                      icon: Icons.edit,
                      onPressed: () {},
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10),
                  const MoniDivider()
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const ClusterDetailHeader(
                    label: "Benefits earned",
                    icon: FaIcon(FontAwesomeIcons.moneyBill1Wave, size: 16),
                  ),
                  const MoniText(
                    "Total CH benefits earned",
                    weight: FontWeight.w300,
                  ),
                  const SizedBox(height: 10),
                  MoniText(
                    Format.toCurrency(550000000),
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 12),
                  const MoniText(
                    "Available benefits",
                    weight: FontWeight.w300,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      MoniText(
                        Format.toCurrency(550000000),
                        weight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const MoniText(
                        "+N5000 today",
                        weight: FontWeight.w400,
                        color: MoniColors.greenLighter,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    child: MoniTextButton(
                      "View earning history",
                      icon: Icons.visibility,
                      onPressed: () {},
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
