import 'package:bacura_app/core/utils/index.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.aboutUs),
      ),
      body: Container(
        padding: EdgeInsets.all(AppSizes.ph12),
        margin: EdgeInsets.all(AppSizes.ph8),
        decoration: BoxDecoration(
          color: ColorManager.midWhiteColor,
          borderRadius: BorderRadius.circular(AppSizes.ph12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BacuraLogoWidget(),
            Divider(color: ColorManager.whiteColor),
            Text(
              AppLocalizations.of(context)!.about_us,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
              textAlign: TextAlign.justify,
            ),
            Divider(color: ColorManager.whiteColor),
            Text(
              AppLocalizations.of(context)!.about_us_body,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: AppSizes.ph25),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.our_website,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorManager.greyColor,
                      ),
                ),
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(
                      AppAssets.bacuraWebsiteURl,
                    );
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Text(
                    AppAssets.bacuraWebsiteURl,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.primaryBlueColor,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
