import 'package:carousel_slider/carousel_slider.dart';
import 'package:codeswipe/features/home/data/blocs/banner_cubit.dart';
import 'package:codeswipe/features/home/presentation/banner_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            ? const _BannerPlaceholder()
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
                          (item) => BannerContent(
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

class _BannerPlaceholder extends StatelessWidget {
  const _BannerPlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.primaryColor,
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
        baseColor: Colors.white.withOpacity(0.4),
        highlightColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(
            kPadding * 4,
          ),
          height: kBannerHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: kPadding * 5,
                      color: theme.primaryColor,
                    ),
                    const SizedBox(
                      height: kPadding * 3,
                    ),
                    Container(
                      color: theme.primaryColor,
                      height: kPadding * 8,
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          kButtonRadius,
                        ),
                        color: theme.primaryColor,
                      ),
                      width: kPadding * 22.5,
                      height: kButtonHeight,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: kPadding * 2,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: kPadding * 6,
                  height: kPadding * 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
