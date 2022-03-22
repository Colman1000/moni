import 'package:flutter/material.dart';
import 'package:moni/widgets/moni_text.dart';

class MoniTextList extends StatelessWidget {
  const MoniTextList(
    this.items, {
    Key? key,
    this.builder,
    this.showNumbering = false,
  }) : super(key: key);

  final List<String> items;
  final bool showNumbering;
  final Widget Function(MapEntry<int, String> item)? builder;

  Widget _build(MapEntry<int, String> item) {
    return (builder ?? _defaultBuilder).call(item);
  }

  Widget _defaultBuilder(MapEntry<int, String> item) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MoniText(
        showNumbering ? "${item.key + 1}. ${item.value}" : item.value,
        weight: FontWeight.w300,
        textType: MoniTextType.body,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items.asMap().entries.map(_build).toList(),
    );
  }
}
