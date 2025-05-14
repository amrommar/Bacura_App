import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class AppBarProfileImageWidget extends StatelessWidget {
  final String imagePath;

  const AppBarProfileImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<MyProfileProvider>(context);

    return InkWell(
      onTap: () {
        profileProvider.token == null
            ? customShowCustomDialog(
                context: context,
                title: tr(AppStrings.login),
                imagePath: AppAssets.badFeedback,
                content: tr(AppStrings.pleaseLoginFirst),
                isOk: true,
                isCancel: true,
                onCancel: () {
                  Navigator.pop(context);
                },
                onOk: () {
                  Navigator.pushNamed(context, Routes.loginRoute);
                },
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileDetailsScreen(),
                ));
      },
      child: Row(
        children: [
          SizedBox(width: AppSizes.pw8),
          Flexible(
            child: CircleAvatar(
              radius: AppSizes.br24,
              backgroundColor: ColorManager.whiteColor,
              child: Image.asset(
                imagePath,
                height: AppSizes.ph60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
