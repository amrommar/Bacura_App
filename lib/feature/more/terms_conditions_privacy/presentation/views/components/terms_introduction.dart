import 'package:bacura_app/core/utils/index.dart';

class TermsIntroduction extends StatelessWidget {
  const TermsIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      tr(AppStrings.termsIntro),
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: ColorManager.darkBlueColor,
          ),
      maxLines: null, // Allows unlimited lines
      textAlign: TextAlign.justify,
    );
  }
}
