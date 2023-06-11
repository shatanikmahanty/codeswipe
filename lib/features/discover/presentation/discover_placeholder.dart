import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverPlaceholder extends StatelessWidget {
  const DiscoverPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;

    final expandedContainer = Expanded(
      flex: 1,
      child: Container(
        height: kPadding * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kButtonRadius),
          color: theme.primaryColor,
        ),
      ),
    );

    return Card(
      color: const Color(0xffF4F4F4),
      margin: const EdgeInsets.symmetric(
        horizontal: kPadding * 4,
        vertical: kPadding * 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kButtonRadius,
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: theme.primaryColor.withOpacity(0.4),
        highlightColor: theme.primaryColor,
        child: SizedBox(
          height: height * 0.75,
          child: Column(
            children: [
              Container(
                height: size.height * 0.4,
                color: theme.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(kPadding * 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kPadding * 2,
                    ),
                    Container(
                      height: kPadding * 3,
                      color: theme.primaryColor,
                    ),
                    const SizedBox(
                      height: kPadding * 2,
                    ),
                    Container(
                      height: kPadding * 15,
                      color: theme.primaryColor,
                    ),
                    const SizedBox(
                      height: kPadding * 4,
                    ),
                    Row(
                      children: [
                        expandedContainer,
                        const SizedBox(width: kPadding * 2),
                        expandedContainer,
                        const SizedBox(width: kPadding * 2),
                        expandedContainer
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
