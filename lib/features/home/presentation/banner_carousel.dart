import 'package:carousel_slider/carousel_slider.dart';
import 'package:codeswipe/features/home/data/blocs/banner_cubit.dart';
import 'package:codeswipe/features/home/presentation/banner_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
