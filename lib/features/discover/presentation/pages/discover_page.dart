import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/discover/presentation/discover_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
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
                      imageUrl: 'https://i.imgur.com/yBijqnU.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: const DiscoverCard(
                    name: 'John Doe',
                    bio: 'I am a developer. '
                        'I code in Flutter and Dart. '
                        'I love animals!',
                    skills: ['Flutter', 'Dart', 'Firebase'],
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kPadding * 4,
                  vertical: kPadding * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kPadding * 5),
                  color: const Color(0xffE1D8F1),
                ),
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
                        onPressed: () {},
                      ),
                      _BottomBarIcon(
                        color: const Color(0xffF018DB),
                        icon: CodeSwipeIcons.love,
                        onPressed: () {},
                      ),
                      _BottomBarIcon(
                        color: const Color(0xffE5A604),
                        icon: CupertinoIcons.star_fill,
                        onPressed: () {},
                      ),
                      // _BottomBarIcon(
                      //   color: Theme.of(context).primaryColor,
                      //   icon: CodeSwipeIcons.filter,
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                )),
          ],
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
