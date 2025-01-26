import 'package:bacura_app/core/utils/index.dart';

class RegisterRowWidget extends StatelessWidget {
  const RegisterRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        AppLocalizations.of(context)!.dont_have_an_account,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorManager.blackColor,
            ),
      ),
      SizedBox(width: AppSizes.pw5),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.completeProfileRoute);
        },
        child: Text(
          AppLocalizations.of(context)!.create_an_account,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      )
    ]);
  }
}
