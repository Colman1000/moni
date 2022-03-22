import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_loan_header.dart';
import 'package:moni/widgets/moni_loan_tile.dart';

class MembersView extends StatelessWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MoniColors.light,
      child: CustomScrollView(
        slivers: [
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                LoanHeader("Overdue Loans"),
                MoniDivider(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index.isEven) {
                  return const MoniLoanTile(
                    "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1570295999919-56ceb5ecca61",
                    user: "Kevin Heart",
                    subtitle: "N10,555,000 Late loan",
                    time: "3 days over",
                    subtitleColor: MoniColors.redDarkest,
                    timeColor: MoniColors.redDarkest,
                  );
                }
                return const MoniDivider();
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: math.max(0, 1 * 2 - 1),
            ),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                MoniDivider(),
                LoanHeader("Due Today"),
                MoniDivider(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index.isEven) {
                  return const MoniLoanTile(
                    "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1570295999919-56ceb5ecca61",
                    user: "Kevin Heart",
                    subtitle: "N10,555,000 Late loan",
                    time: "3 days over",
                    subtitleColor: MoniColors.yellowDarkest,
                    timeColor: MoniColors.yellowDarkest,
                  );
                }
                return const MoniDivider();
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: math.max(0, 2 * 2 - 1),
            ),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                MoniDivider(),
                LoanHeader("Active Loans"),
                MoniDivider(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index.isEven) {
                  return const MoniLoanTile(
                    "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1570295999919-56ceb5ecca61",
                    user: "Kevin Heart",
                    subtitle: "N10,555,000 Late loan",
                    time: "3 days over",
                    subtitleColor: MoniColors.greenDarkest,
                    timeColor: MoniColors.greenDarkest,
                  );
                }
                return const MoniDivider();
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: math.max(0, 3 * 2 - 1),
            ),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                MoniDivider(),
                LoanHeader("Inactive Loans"),
                MoniDivider(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index.isEven) {
                  return const MoniLoanTile(
                    "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1570295999919-56ceb5ecca61",
                    user: "Kevin Heart",
                    subtitleColor: MoniColors.darkBase,
                  );
                }
                return const MoniDivider();
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: math.max(0, 3 * 2 - 1),
            ),
          ),
        ],
      ),
    );
  }
}
