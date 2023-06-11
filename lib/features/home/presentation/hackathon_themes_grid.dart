import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class HackathonThemesGrid extends StatelessWidget {
  const HackathonThemesGrid({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 3,
          vertical: kPadding * 2,
        ),
        itemCount:
            kHackathonThemesList.length > 6 ? 6 : kHackathonThemesList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: kPadding * 2,
          crossAxisSpacing: kPadding * 2,
          childAspectRatio: 3,
        ),
        itemBuilder: (BuildContext context, int index) => ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(
              kPadding,
            ),
            child: Text(
              kHackathonThemesList[index],
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      );
}
