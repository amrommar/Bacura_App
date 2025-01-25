import 'package:bacura_app/core/utils/index.dart';

class AppBarProfileImageWidget extends StatelessWidget {
  const AppBarProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.personalDetailsRoute);
        },
        child: Row(children: [
          SizedBox(width: 8.w),
          Flexible(
              child: CircleAvatar(
                  radius: 23.w,
                  backgroundColor: ColorManager.whiteColor,
                  child: Image.asset(
                    AppAssets.avatar,
                  )))
        ]));
  }
}
