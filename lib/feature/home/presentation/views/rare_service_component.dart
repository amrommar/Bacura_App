import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/views/components/rare_service_widget.dart';

class RareServiceComponent extends StatelessWidget {
  const RareServiceComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
