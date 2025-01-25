import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/views/rare_service_component.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AdsBannerSliderComponent(),
          ServicesComponent(),
          const SizedBox(height: 10),
          Text(AppLocalizations.of(context)!.services_for_you,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
          const RareServiceComponent()
        ],
      ),
    );
  }
}
