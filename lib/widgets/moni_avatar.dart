import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/widgets/moni_text.dart';

class MoniAvatar extends StatelessWidget {
  const MoniAvatar({
    Key? key,
    required this.name,
    this.imageUrl,
    this.size = 48,
  }) : super(key: key);

  final String? imageUrl;
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    final _color = Colors.primaries[name.length % Colors.primaries.length];

   final _nameAvatar =  Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[_color.shade300, _color.shade800],
          )),
      child: Center(
        child: MoniText(
          name[0].toUpperCase(),
          weight: FontWeight.w700,
          color: _color.computeLuminance() < 6
              ? MoniColors.light
              : MoniColors.dark,
        ),
      ),
    );

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: imageUrl == null
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[_color.shade300, _color.shade800],
              )
            : null,
      ),
      child: imageUrl == null
          ? Center(
              child: MoniText(
                name[0].toUpperCase(),
                weight: FontWeight.w700,
                color: _color.computeLuminance() < 6
                    ? MoniColors.light
                    : MoniColors.dark,
              ),
            )
          : Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, _err, trace) {
                return _nameAvatar;
              },
              loadingBuilder: (context, child, p) {
                return p?.expectedTotalBytes == null
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          value:
                              p!.cumulativeBytesLoaded / p.expectedTotalBytes!,
                        ),
                      );
              },
            ),
    );
  }
}
