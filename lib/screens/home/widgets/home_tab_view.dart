import 'package:flutter/material.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:provider/provider.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/screens/home/views/cluster_detail_view.dart';
import 'package:moni/screens/home/views/members_view.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _agents = context.watch<ClusterModel>().totalAgents;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Material(
            color: MoniColors.secondaryLightest,
            child: TabBar(
              tabs: [
                Tab(
                  text: "Members${_agents > 0 ? " ($_agents)" : ""}",
                ),
                const Tab(
                  text: 'Cluster Details',
                )
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                MembersView(),
                ClusterDetailView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
