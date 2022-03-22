import 'package:flutter/material.dart';
import 'package:moni/widgets/moni_text.dart';

class MoniLoanHeader extends StatelessWidget {
  const MoniLoanHeader(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MoniPersistentHeaderDelegate(label),
      pinned: true,
    );
  }
}

class LoanHeader extends StatelessWidget {
  const LoanHeader(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MoniText(label, weight: FontWeight.w400),
      trailing: const Icon(Icons.minimize),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
    );
  }
}

class MoniPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String label;

  MoniPersistentHeaderDelegate(this.label);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return LoanHeader(label);
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
