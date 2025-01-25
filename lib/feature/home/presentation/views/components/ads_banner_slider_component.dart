import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';

class AdsBannerSliderComponent extends StatelessWidget {
  AdsBannerSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Padding(
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
                  viewportFraction: 0.95))),
    );
  }
}
