import 'dart:math';

import 'package:flutter/material.dart';

import '../../../configurations/constants/assets.gen.dart';

class StackedIllustration extends StatelessWidget {
  const StackedIllustration({
    super.key,
    this.flip = false,
    required this.illustration,
  });

  final Image illustration;
  final bool flip;

  @override
  Widget build(BuildContext context) {
    final vectorBg = Assets.images.vectorBg.svg(
      width: MediaQuery.of(context).size.width,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        if (flip)
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: vectorBg,
          )
        else
          vectorBg,
        illustration
      ],
    );
  }
}
