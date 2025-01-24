import 'package:bacura_app/core/utils/index.dart';

class BacuraLogoWidget extends StatelessWidget {
  const BacuraLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280.h,
        child: SvgPicture.asset(AppAssets.bacuraLogo),
      ),
    );
  }
}
