import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/home/presentation/widgets/rare_service_widget.dart';

class RareServiceComponent extends StatelessWidget {
  const RareServiceComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Column(
        children: [
          Text(AppLocalizations.of(context)!.services_for_you,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /////////////////       Cinema Section     ////////////////////////////
              RareServiceWidget(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CinemaDetailsScreen()));
                },
                imagePath: 'assets/images/png/cinemaWhite.png',
                serviceTitle: 'السينما المنزلية',
              ),
              /////////////////    Consultation Section    ////////////////////////////
              RareServiceWidget(
                imagePath: 'assets/images/png/consultationWhite.png',
                serviceTitle: 'الاستشارات',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ConsultationScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
