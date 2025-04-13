import 'package:bacura_app/core/localization/app_localization.dart';
import 'package:bacura_app/core/utils/index.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.loginRoute);
      },
      child: Text(
        tr(AppStrings.login),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
