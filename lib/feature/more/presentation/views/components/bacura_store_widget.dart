import 'package:bacura_app/core/utils/index.dart';

class BacuraStoreWidget extends StatelessWidget {
  const BacuraStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: AppSizes.ph80,
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
            onTap: () async {
              final Uri url = Uri.parse(
                AppAssets.bacuraStoreURL,
              );
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(
                Icons.store_outlined,
                size: AppSizes.ph35,
                color: ColorManager.midBlueColor,
              ),
              SizedBox(height: AppSizes.ph5),
              Text(tr(AppStrings.bacuraStore),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      )),
            ])));
  }
}
