import 'package:bacura_app/core/utils/index.dart';

class RegisterRowWidget extends StatelessWidget {
  const RegisterRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        tr(AppStrings.dontHaveAccount),
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
          tr(AppStrings.createAccount),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      )
    ]);
  }
}
