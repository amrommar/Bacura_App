import 'package:bacura_app/core/utils/index.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppWidget extends StatelessWidget {
  const ShareAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: AppSizes.ph86,
          minWidth: AppSizes.pw140,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw5,
          vertical: AppSizes.ph5,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.midBlueColor),
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(AppSizes.br8),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw6,
          vertical: AppSizes.ph3,
        ),
        child: InkWell(
            onTap: () {
              shareApp();
            },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(
                Icons.share_outlined,
                size: AppSizes.ph35,
                color: ColorManager.midBlueColor,
              ),
              SizedBox(height: AppSizes.ph5),
              Text(tr(AppStrings.shareApp),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      )),
            ])));
  }
}

void shareApp() {
  final appUrl = Platform.isAndroid
      ? 'https://play.google.com/store/apps/details?id=com.bacura.app'
      : 'https://apps.apple.com/app/id1234567890'; // ← غيّر الرقم بعد ما يطلعلك من App Store Connect

  Share.share('جرب تطبيق Bacura الإحترافي دلوقتي! 😍👇\n$appUrl');
}
