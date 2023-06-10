import 'package:flutter/material.dart';

import '../../../../configurations/configurations.dart';
import '../presentation.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const SingleChildScrollView(
        child: Column(
          children: [
            BannerCarousel(),
          ],
        ),
      );
}
