import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<MyProfileProvider>(context);

    return Padding(
      padding: EdgeInsets.all(AppSizes.ph16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () async {
          showCustomDialog(context, profileProvider: profileProvider);
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
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context, {required MyProfileProvider profileProvider}) {
  showDialog(
    context: context,
    builder: (context) => CustomAlertDialog(
      title: AppStrings.confirm,
      imagePath: AppAssets.logout,
      content: const Text(AppStrings.confirmLogout),
      onCancel: () {
        Navigator.of(context).pop();
      },
      onOk: () {
        profileProvider.logout();
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
