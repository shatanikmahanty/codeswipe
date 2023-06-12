import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:codeswipe/features/home/data/blocs/banner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../configurations/configurations.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _carouselController = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) => state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: state.models.length > 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: state.models
                        .map(
                          (item) => _BannerContent(
                            heading: item.heading,
                            subHeading: item.subHeading,
                            buttonText: item.buttonText,
                            imgUrl: item.imgUrl,
                            onButtonPressed: item.onClick,
                          ),
                        )
                        .toList(),
                    carouselController: _carouselController,
                  ),
                  if (state.models.isNotEmpty)
                    AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: state.models.length,
                      effect: SwapEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotHeight: kPadding * 2,
                        dotWidth: kPadding * 2,
                        type: SwapType.yRotation,
                      ),
                    ),
                ],
              ),
      );
}

class _BannerContent extends StatelessWidget {
  const _BannerContent({
    required this.heading,
    required this.subHeading,
    required this.buttonText,
    required this.imgUrl,
    required this.onButtonPressed,
  });

  final String heading;
  final String subHeading;
  final String buttonText;
  final String imgUrl;
  final String? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryColor = theme.primaryColor;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kPadding * 2,
        horizontal: kPadding * 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kButtonRadius,
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(
            kPadding * 4,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: kPadding,
                    ),
                    Text(
                      subHeading,
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryColor,
                        ),
                        onPressed: () {
                          if (onButtonPressed == null) {
                            return;
                          } else if (onButtonPressed!.contains('launch')) {
                            launchUrlString(
                              onButtonPressed!.replaceFirst('launch:', ''),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Text(
                          buttonText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: kPadding,
              ),
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fadeInCurve: Curves.easeIn,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
