import 'package:flutter/material.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:provider/provider.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/screens/home/widgets/render_loan_tiles.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_loan_header.dart';

class MembersView extends StatelessWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _clusterDetail = context.watch<ClusterModel>().detail;

    return Material(
      color: MoniColors.light,
      child: CustomScrollView(
        slivers: [
          if (_clusterDetail.overdue.isNotEmpty) ...[
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  LoanHeader("Overdue Loans"),
                  MoniDivider(),
                ],
              ),
            ),
            RenderLoanTiles(
              _clusterDetail.overdue,
              subtitleColor: MoniColors.redDarkest,
              captionColor: MoniColors.redDarkest,
            ),
          ],
          if (_clusterDetail.due.isNotEmpty) ...[
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  MoniDivider(),
                  LoanHeader("Due Today"),
                  MoniDivider(),
                ],
              ),
            ),
            RenderLoanTiles(
              _clusterDetail.due,
              subtitleColor: MoniColors.yellowDarkest,
              captionColor: MoniColors.yellowDarkest,
            ),
          ],
          if (_clusterDetail.active.isNotEmpty) ...[
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  MoniDivider(),
                  LoanHeader("Active Loans"),
                  MoniDivider(),
                ],
              ),
            ),
            RenderLoanTiles(
              _clusterDetail.active,
              subtitleColor: MoniColors.greenDarkest,
              captionColor: MoniColors.greenDarkest,
            ),
          ],
          if (_clusterDetail.inactive.isNotEmpty) ...[
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  MoniDivider(),
                  LoanHeader("Inactive Loans"),
                  MoniDivider(),
                ],
              ),
            ),
            RenderLoanTiles(
              _clusterDetail.inactive,
            ),
          ],
        ],
      ),
    );
  }
}
