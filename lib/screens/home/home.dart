import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:moni/screens/home/widgets/home_tab_view.dart';
import 'package:moni/screens/home/widgets/home_header_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String name = "/home";

  @override
  Widget build(BuildContext context) {
    final _isLoading = context.watch<ClusterModel>().isQueryingServer;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_isLoading)
              const Expanded(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              )
            else ...[
              const HomeHeaderBar(),
              const Expanded(
                child: HomeTabView(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
