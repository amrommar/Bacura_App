import 'package:bacura_app/core/utils/index.dart';

class ContinueAsVisitorButton extends StatelessWidget {
  const ContinueAsVisitorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.lightBlueColor,
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homeRoute,
            (Route<dynamic> route) => false,
          );
        },
        child: Text(tr(AppStrings.continueAsVisitor),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.primaryBlueColor,
                )));
  }
}
