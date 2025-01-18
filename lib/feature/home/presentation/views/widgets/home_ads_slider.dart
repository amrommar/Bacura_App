import 'package:bacura_app/core/utils/index.dart';

class HomeAdsSlider extends StatelessWidget {
  const HomeAdsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: CarouselSlider(
            items: List.generate(
              10, // Number of items
              (index) => AdsContainer(), // Create each widget dynamically
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
