import 'package:bacura_app/core/utils/index.dart';

class PrivacyPolicyIntro extends StatelessWidget {
  const PrivacyPolicyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(tr(AppStrings.privacyPolicyIntro),
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorManager.darkBlueColor,
            ),
        maxLines: null, // Allows unlimited lines
        textAlign: TextAlign.justify);
  }
}
