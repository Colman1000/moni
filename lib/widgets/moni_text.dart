import 'package:flutter/material.dart';

class MoniText extends StatelessWidget {
  const MoniText(
    this.text, {
    Key? key,
    this.textType,
    this.color,
    this.align,
    this.weight,
    this.bold = false,
    this.selectable = false,
  }) : super(key: key);

  final String text;
  final MoniTextType? textType;
  final Color? color;
  final bool bold;
  final bool selectable;
  final TextAlign? align;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;

    final _textTheme = textType == MoniTextType.header
        ? _theme.headline6
        : textType == MoniTextType.subtitle
            ? _theme.caption
            : textType == MoniTextType.large
                ? _theme.labelLarge
                : textType == MoniTextType.tiny
                    ? _theme.caption?.copyWith(fontSize: 10)
                    : _theme.bodyMedium;

    final _style = _textTheme?.copyWith(
      color: color,
      fontWeight: weight ?? (bold ? FontWeight.w500 : FontWeight.w100),
    );

    return selectable
        ? SelectableText(
            text,
            style: _style,
            textAlign: align,
          )
        : Text(
            text,
            style: _style,
            textAlign: align,
          );
  }
}

enum MoniTextType { header, large, body, subtitle, tiny }
