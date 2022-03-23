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

    final _rad = BorderRadius.circular(12);

    final _name = Center(
      child: MoniText(
        name[0].toUpperCase(),
        weight: FontWeight.w700,
        color:
            _color.computeLuminance() < 6 ? MoniColors.light : MoniColors.dark,
      ),
    );

    final _decor = BoxDecoration(
      borderRadius: _rad,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[_color.shade300, _color.shade800],
      ),
    );

    final _nameAvatar = Container(
      height: size,
      width: size,
      decoration: _decor,
      child: _name,
    );

    return ClipRRect(
      borderRadius: _rad,
      child: Container(
        height: size,
        width: size,
        color: MoniColors.grey,
        child: imageUrl == null
            ? _nameAvatar
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (c, err, trace) => _nameAvatar,
                loadingBuilder: (context, child, p) {
                  if (p == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
      ),
    );
  }
}
