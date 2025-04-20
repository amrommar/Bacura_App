import 'package:bacura_app/core/utils/index.dart';

class NotificationImageWidget extends StatelessWidget {
  const NotificationImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSizes.br30,
          ),
        ),
        child: CircleAvatar(
            radius: AppSizes.br30,
            backgroundColor: ColorManager.whiteColor,
            ///////////////    from Back-End     /////////////////////
            child: Image.asset(AppAssets.bacuraImage) // Adjust the radius to make sure it fits
            ));
  }
}
