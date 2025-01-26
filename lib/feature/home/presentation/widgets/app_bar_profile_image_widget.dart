import 'package:bacura_app/core/utils/index.dart';

class AppBarProfileImageWidget extends StatelessWidget {
  final String imagePath;
  const AppBarProfileImageWidget({super.key, required this.imagePath});

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
                  child: Image.network(
                    imagePath,
                  )))
        ]));
  }
}
