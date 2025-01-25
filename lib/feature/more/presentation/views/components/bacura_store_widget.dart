import 'package:bacura_app/core/utils/index.dart';

class BacuraStoreWidget extends StatelessWidget {
  const BacuraStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 75, minWidth: 140),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.midBlueColor),
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
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
                size: 35,
                color: ColorManager.midBlueColor,
              ),
              const SizedBox(height: 5),
              Text(AppLocalizations.of(context)!.bacura_store,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      )),
            ])));
  }
}
