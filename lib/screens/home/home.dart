import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/screens/home/views/cluster_detail_view.dart';
import 'package:moni/screens/home/widgets/home_tab_view.dart';
import 'package:moni/screens/home/widgets/home_header_bar.dart';
import 'package:moni/widgets/moni_avatar.dart';
import 'package:moni/widgets/moni_divider.dart';
import 'package:moni/widgets/moni_info_pill.dart';
import 'package:moni/widgets/buttons/moni_filled_button.dart';
import 'package:moni/widgets/moni_loan_header.dart';
import 'package:moni/widgets/moni_loan_tile.dart';
import 'package:moni/widgets/moni_text.dart';
import 'package:moni/widgets/buttons/moni_text_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String name = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            HomeHeaderBar(),
            Expanded(
              child: HomeTabView(),
            ),
          ],
        ),
      ),
    );
  }
}
