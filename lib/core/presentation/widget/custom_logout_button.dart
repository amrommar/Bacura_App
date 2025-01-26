import 'package:bacura_app/core/utils/index.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'تأكيد',
        imagePath: 'assets/images/log-out.png',
        content: const Text('تأكيد تسجيل الخروج'),
        onCancel: () {
          Navigator.of(context).pop();
        },
        onOk: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const GetStartedScreen(),
              ),
              ModalRoute.withName(Routes.getStartedRoute)); // Will remove all routes until this one
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(AppSizes.ph16),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              showCustomDialog(context);
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: AppSizes.pw10),
                  Icon(
                    Icons.login_outlined,
                    color: ColorManager.whiteColor,
                    size: AppSizes.ph25,
                  )
                ])));
  }
}
