import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdsBannerSliderComponent extends StatefulWidget {
  const AdsBannerSliderComponent({super.key});

  @override
  _AdsBannerSliderComponentState createState() => _AdsBannerSliderComponentState();
}

class _AdsBannerSliderComponentState extends State<AdsBannerSliderComponent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
            child: CarouselSlider(
              items: List.generate(
                provider.bannerEntity.length,
                (index) => AdsWidget(
                  imagePath: provider.bannerEntity[index].image,
                ),
              ),
              options: CarouselOptions(
                height: 165.h,
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 0.95,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              provider.bannerEntity.length,
              (index) => Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
