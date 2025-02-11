import 'package:bacura_app/core/providers/core_provider.dart';
import 'package:bacura_app/core/utils/index.dart';

class AppBarProfileImageWidget extends StatelessWidget {
  final String imagePath;

  const AppBarProfileImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.profileDetailsRoute);
      },
      child: Row(
        children: [
          SizedBox(width: AppSizes.pw8),
          Flexible(
            child: CircleAvatar(
              radius: AppSizes.br24,
              backgroundColor: ColorManager.whiteColor,
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
