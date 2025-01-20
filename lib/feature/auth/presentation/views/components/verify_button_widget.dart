import 'package:bacura_app/core/utils/index.dart';

class VerifyButtonWidget extends StatelessWidget {
  Function() onPressed;

  VerifyButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Call the validation method
          onPressed();
        },
        child: Text(
          AppLocalizations.of(context)!.verify,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
