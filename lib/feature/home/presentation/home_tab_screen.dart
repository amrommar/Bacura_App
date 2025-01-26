import 'package:bacura_app/core/presentation/widget/custom_loading_shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/home/presentation/views/rare_service_component.dart';
import 'package:dartz/dartz.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              provider.isSliderLoading ? const SliderShimmerWidget() : const AdsBannerSliderComponent(),
              provider.isSliderLoading ? const ServicesShimmerWidget() : ServicesComponent(),
              const SizedBox(height: 10),
              const RareServiceComponent(),
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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [
        CustomLoadingShimmer(width: double.infinity, height: 200),
        SizedBox(height: 10),
      ]),
    );
  }
}

class ServicesShimmerWidget extends StatelessWidget {
  const ServicesShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [
        CustomLoadingShimmer(width: double.infinity, height: 250),
        SizedBox(height: 10),
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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [CustomLoadingShimmer(width: double.infinity, height: 200)]),
    );
  }
}
