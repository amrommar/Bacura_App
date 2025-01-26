import 'package:bacura_app/core/utils/index.dart';

class BacuraLogoWidget extends StatelessWidget {
  const BacuraLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSizes.pw280,
        child: SvgPicture.asset(
          AppAssets.bacuraLogo,
          height: AppSizes.ph200,
          width: AppSizes.pw280,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
