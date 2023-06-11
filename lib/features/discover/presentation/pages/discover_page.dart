import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/no_items.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/discover/data/blocs/discover_cubit.dart';
import 'package:codeswipe/features/discover/presentation/discover_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../discover_placeholder.dart';

@RoutePage()
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: BlocBuilder<DiscoverCubit, DiscoverState>(
          builder: (context, state) => state.isLoading
              ? const DiscoverPlaceholder()
              : _DiscoverContent(
                  profiles: state.profiles,
                ),
        ),
      );
}

class _DiscoverContent extends StatefulWidget {
  const _DiscoverContent({required this.profiles});

  final List<AppUser> profiles;

  @override
  State<_DiscoverContent> createState() => _DiscoverContentState();
}

class _DiscoverContentState extends State<_DiscoverContent> {
  late final SwipableStackController _controller;

  @override
  void initState() {
    _controller = SwipableStackController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final profiles = widget.profiles;
    AppUser? nextProfile;
    if (profiles.length >= 2 && currentIndex < profiles.length - 1) {
      nextProfile = profiles[currentIndex + 1];
    } else {
      nextProfile = null;
    }
    final size = MediaQuery.of(context).size;
    final isStackEmpty = currentIndex == profiles.length;

    return Column(
      children: [
        if (isStackEmpty)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height / 5,
              horizontal: kPadding * 2,
            ),
            child: const NoItems(
              message:
                  'You have swiped all the profiles. Come back later to view more',
            ),
          )
        else ...[
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.7,
                width: double.infinity,
              ),
              if (nextProfile != null)
                SizedBox(
                  height: size.height * 0.7,
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: kPadding * 6,
                      vertical: kPadding * 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        kButtonRadius,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: nextProfile.avatar!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                width: size.width,
                height: size.height * 0.65,
                child: SwipableStack(
                  detectableSwipeDirections: const {
                    SwipeDirection.left,
                    SwipeDirection.right,
                    SwipeDirection.up,
                  },
                  controller: _controller,
                  itemCount: profiles.length,
                  allowVerticalSwipe: true,
                  onSwipeCompleted: (index, direction) async {
                    if (direction == SwipeDirection.right) {
                      await context.read<DiscoverCubit>().likeProfile(
                            profiles[index].id,
                          );
                    } else if (direction == SwipeDirection.left) {
                      await context.read<DiscoverCubit>().disLikeProfile(
                            profiles[index].id,
                          );
                    }
                    setState(() {
                      currentIndex += 1;
                    });
                  },
                  builder: (context, swipeProperties) {
                    final profile = profiles[swipeProperties.index];

                    return DiscoverCard(
                      name: profile.name,
                      bio: profile.bio ?? 'I am a Code Swipe User',
                      skills: profile.skills?.map((e) => e).toList(),
                      avatar: profile.avatar!,
                    );
                  },
                ),
              ),
            ],
          ),
          _BottomBar(controller: _controller),
        ],
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.controller});

  final SwipableStackController controller;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: kPadding * 4,
          vertical: kPadding * 2,
        ),
        child: Card(
          elevation: kPadding / 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kPadding * 5),
          ),
          color: const Color(0xffE1D8F1),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kPadding * 1.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BottomBarIcon(
                  color: const Color(0xffF27121),
                  icon: CodeSwipeIcons.reject,
                  onPressed: () {
                    controller.next(swipeDirection: SwipeDirection.left);
                  },
                ),
                _BottomBarIcon(
                  color: const Color(0xffF018DB),
                  icon: CodeSwipeIcons.love,
                  onPressed: () {
                    controller.next(swipeDirection: SwipeDirection.right);
                  },
                ),
                _BottomBarIcon(
                  color: const Color(0xffE5A604),
                  icon: CupertinoIcons.star_fill,
                  onPressed: () {
                    controller.next(swipeDirection: SwipeDirection.up);
                  },
                ),
                // _BottomBarIcon(
                //   color: Theme.of(context).primaryColor,
                //   icon: CodeSwipeIcons.filter,
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ),
      );
}

class _BottomBarIcon extends StatelessWidget {
  const _BottomBarIcon(
      {required this.color, required this.icon, this.onPressed});

  final Color color;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        color: color,
        icon: Padding(
          padding: const EdgeInsets.all(kPadding / 2),
          child: Icon(
            icon,
            size: kPadding * 3,
          ),
        ),
        onPressed: onPressed,
      );
}
