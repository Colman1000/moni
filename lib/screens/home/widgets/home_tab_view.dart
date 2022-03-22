import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/screens/home/views/cluster_detail_view.dart';
import 'package:moni/screens/home/views/members_view.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          Material(
            color: MoniColors.secondaryLightest,
            child: TabBar(
              tabs: [
                Tab(
                  text: "Members (9)",
                ),
                Tab(
                  text: "Cluster Details",
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [MembersView(), ClusterDetailView()],
            ),
          ),
        ],
      ),
    );
  }
}
