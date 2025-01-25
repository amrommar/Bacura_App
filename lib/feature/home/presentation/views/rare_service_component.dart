import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/widgets/rare_service_widget.dart';

class RareServiceComponent extends StatelessWidget {
  const RareServiceComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.services_for_you,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.darkBlueColor,
                  fontWeight: FontWeight.bold,
                )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /////////////////       Cinema Section     ////////////////////////////
            RareServiceWidget(
              onTap: () {
                Navigator.pushNamed(context, Routes.cinemaDetailsRoute);
              },
              imagePath: 'assets/images/cinemaWhite.png',
              serviceTitle: 'السينما المنزلية',
            ),
            /////////////////    Consultation Section    ////////////////////////////
            RareServiceWidget(
              imagePath: 'assets/images/consultationWhite.png',
              serviceTitle: 'الاستشارات',
              onTap: () {
                Navigator.pushNamed(context, Routes.consultationScreenRoute);
              },
            ),
          ],
        ),
      ],
    );
  }
}
