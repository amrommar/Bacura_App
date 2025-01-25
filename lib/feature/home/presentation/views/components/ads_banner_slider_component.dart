import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';

class AdsBannerSliderComponent extends StatelessWidget {
  List<String> images = [
    AppAssets.banner,
    AppAssets.banner2,
    AppAssets.banner3,
  ];

  AdsBannerSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: CarouselSlider(
            items: List.generate(
              3, // Number of items
              (index) => AdsWidget(
                imagePath: images[index],
              ), // Create each widget dynamically
            ),
            options: CarouselOptions(
                height: 165.h,
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 0.95)));
  }
}
