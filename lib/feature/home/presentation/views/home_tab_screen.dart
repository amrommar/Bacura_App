import 'package:bacura_app/core/presentation/widget/custom_loading_shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/home/presentation/views/components/ads_banner_slider_component.dart';
import 'package:bacura_app/feature/home/presentation/views/components/rare_service_component.dart';
import 'package:bacura_app/feature/home/presentation/views/components/services_component.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => HomeProvider(context),
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              provider.isSliderLoading ? const SliderShimmerWidget() : const AdsBannerSliderComponent(),
              provider.isCategoryLoading ? const SliderShimmerWidget() : const RareServiceComponent(),
              SizedBox(height: AppSizes.ph10),
              provider.isCategoryLoading ? const CategoryShimmerWidget() : const CategoryComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderShimmerWidget extends StatelessWidget {
  const SliderShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.ph8),
      child: Column(children: [
        CustomLoadingShimmer(
          width: double.infinity,
          height: AppSizes.ph200,
        ),
        SizedBox(height: AppSizes.ph10),
      ]),
    );
  }
}

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.ph8),
      child: Column(children: [
        CustomLoadingShimmer(
          width: double.infinity,
          height: AppSizes.ph250,
        ),
        SizedBox(height: AppSizes.ph10),
      ]),
    );
  }
}

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.ph8),
      child: Column(children: [
        CustomLoadingShimmer(
          width: double.infinity,
          height: AppSizes.ph200,
        ),
      ]),
    );
  }
}
