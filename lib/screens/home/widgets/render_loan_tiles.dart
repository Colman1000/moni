import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moni/models/loan_agent.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_loan_tile.dart';

class RenderLoanTiles extends StatelessWidget {
  const RenderLoanTiles(
    this.agents, {
    Key? key,
    this.subtitleColor,
    this.captionColor,
  }) : super(key: key);

  final List<LoanAgent> agents;
  final Color? subtitleColor;
  final Color? captionColor;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isEven) {
            final int itemIndex = index ~/ 2;
            final _agent = agents[itemIndex];
            return MoniLoanTile(
              user: _agent.name,
              userImageUrl: _agent.avatar,
              subtitle: _agent.subtitleString,
              time: _agent.captionString,
              subtitleColor: _agent.subtitleColor,
              timeColor: _agent.captionColor,
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
        childCount: math.max(0, (agents.length * 2) - 1),
      ),
    );
  }
}
