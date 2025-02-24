import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';

class AdsBannerSliderComponent extends StatefulWidget {
  const AdsBannerSliderComponent({super.key});

  @override
  _AdsBannerSliderComponentState createState() => _AdsBannerSliderComponentState();
}

class _AdsBannerSliderComponentState extends State<AdsBannerSliderComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph15),
            child: CarouselSlider(
              items: List.generate(
                provider.bannerEntity.length,
                (index) => InkWell(
                  onTap: () {
                    provider.onBannerClicked(id: provider.bannerEntity[index].id);
                    provider.navigateOnBannerClicked(
                        id: provider.bannerEntity[index].offerId ?? 0, context: context, index: index);
                  },
                  child: AdsWidget(
                    imagePath: provider.bannerEntity[index].image,
                  ),
                ),
              ),
              options: CarouselOptions(
                height: AppSizes.ph165,
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 0.95,
                onPageChanged: (index, reason) {
                  setState(() {
                    provider.currentIndex = index;
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
                width: AppSizes.pw8,
                height: AppSizes.ph8,
                margin: EdgeInsets.symmetric(
                  vertical: AppSizes.ph10,
                  horizontal: AppSizes.pw4,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: provider.currentIndex == index ? Colors.blue : Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
