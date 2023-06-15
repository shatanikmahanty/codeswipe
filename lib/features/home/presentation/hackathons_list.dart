import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../configurations/theme/size_constants.dart';
import '../data/models/hackathon_model.dart';

class HackathonsList extends StatelessWidget {
  HackathonsList({
    super.key,
    required this.hackathons,
    this.itemCount,
    required this.shrinkWrap,
    this.heroTag,
    this.onJoinButtonPressed,
  });

  final Object? heroTag;

  final List<HackathonModel> hackathons;

  /// If left null then the list's length will be used
  final int? itemCount;

  final bool shrinkWrap;

  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');

  final void Function(int)? onJoinButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final listView = ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding * 3,
      ),
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      itemBuilder: (context, index) {
        final hackathon = hackathons[index];

        return Padding(
          padding: EdgeInsets.only(
            bottom: index != ((itemCount ?? hackathons.length) - 1)
                ? kPadding * 2
                : 0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      kButtonRadius,
                    ),
                    border: Border.all(
                      color: theme.primaryColor,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        hackathon.banner,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: kPadding * 15,
                  height: kPadding * 12,
                ),
              ),
              const SizedBox(
                width: kPadding * 2,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      hackathon.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2D3B70),
                      ),
                    ),
                    const SizedBox(
                      height: kPadding / 2,
                    ),
                    Row(
                      children: [
                        Text(
                          hackathon.theme,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: kPadding,
                        ),
                        Text(
                          hackathon.mode,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kPadding,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: kPadding * 2,
                        ),
                        const SizedBox(
                          width: kPadding,
                        ),
                        Text(
                          _dateFormat.format(hackathon.startDate),
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: kPadding * 5,
                          width: kPadding * 12,
                          child: ElevatedButton(
                            onPressed: () => onJoinButtonPressed?.call(index),
                            child: const Text('Join'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: itemCount ?? hackathons.length,
    );

    return heroTag != null
        ? Hero(
            tag: heroTag!,
            child: listView,
          )
        : listView;
  }
}
