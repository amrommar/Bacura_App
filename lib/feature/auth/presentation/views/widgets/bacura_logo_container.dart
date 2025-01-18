import 'package:bacura_app/core/utils/index.dart';

class BacuraLogoContainer extends StatelessWidget {
  const BacuraLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280.h,
        child: SvgPicture.asset(ImageAssets.bacuraLogo),
      ),
    );
  }
}
