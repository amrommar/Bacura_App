import 'package:bacura_app/core/utils/index.dart';

class ChangeLanguageRowWidget extends StatelessWidget {
  const ChangeLanguageRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(AppSizes.br8),
        ),
        margin: EdgeInsets.symmetric(horizontal: AppSizes.pw8, vertical: AppSizes.ph3),
        padding: EdgeInsets.all(AppSizes.ph12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.language,
            color: ColorManager.midBlueColor,
            size: AppSizes.ph24,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(right: AppSizes.pw4, left: AppSizes.pw4, top: AppSizes.ph3),
            child: Text(AppLocalizations.of(context)!.app_Language,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.blackColor,
                    )),
          )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.pw4,
              ),
              child: InkWell(
                  onTap: () {
                    // provider.changeLanguage();
                  },
                  child: Text('العربية',
                      // AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                            fontWeight: FontWeight.bold,
                          ))))
        ]));
  }
}
