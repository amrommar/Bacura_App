import 'package:bacura_app/core/utils/index.dart';

class ShareAppContainer extends StatelessWidget {
  const ShareAppContainer({super.key});

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
            onTap: () {},
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(
                Icons.share_outlined,
                size: 35,
                color: ColorManager.midBlueColor,
              ),
              const SizedBox(height: 5),
              Text(AppLocalizations.of(context)!.share_app,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      )),
            ])));
  }
}
