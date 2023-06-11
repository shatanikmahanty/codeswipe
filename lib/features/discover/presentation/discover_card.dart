import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
    super.key,
    required this.name,
    required this.bio,
    required this.skills,
    required this.avatar,
  });

  final String name, bio, avatar;
  final List<String>? skills;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryColor = theme.primaryColor;

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
      elevation: 0,
      child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.36,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: avatar,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(kPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kPadding * 2,
                  ),
                  Text(
                    name,
                    style: textTheme.headlineSmall?.copyWith(
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: kPadding * 2,
                  ),
                  Text(
                    bio,
                    style: textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: kPadding * 2,
                  ),
                  if (skills != null)
                    SizedBox(
                      height: kPadding * 6,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: skills!
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.only(right: kPadding),
                                padding: const EdgeInsets.all(kPadding / 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                    width: kPadding / 4,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    kButtonRadius,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    kPadding,
                                  ),
                                  child: Text(
                                    '#$e',
                                    style: textTheme.labelMedium?.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  const SizedBox(
                    height: kPadding * 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
