import 'package:bacura_app/core/utils/index.dart';

class ChangeLanguageRow extends StatelessWidget {
  const ChangeLanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        padding: const EdgeInsets.all(12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.language,
            color: ColorManager.midBlueColor,
            size: 23,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 4, left: 4, top: 3),
            child: Text(AppLocalizations.of(context)!.app_Language,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.blackColor,
                    )),
          )),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p4,
              ),
              child: InkWell(
                  onTap: () {
                    provider.changeLanguage();
                  },
                  child: Text(AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                            fontWeight: FontWeight.bold,
                          ))))
        ]));
  }
}
