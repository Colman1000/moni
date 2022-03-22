import 'package:flutter/material.dart';

class MoniAvatar extends StatelessWidget {
  const MoniAvatar(this.imageUrl, {Key? key, this.size = 48}) : super(key: key);

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
