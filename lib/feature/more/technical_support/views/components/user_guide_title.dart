import 'package:bacura_app/core/utils/index.dart';

class UserGuideTitle extends StatelessWidget {
  String title;

  UserGuideTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: ColorManager.primaryBlueColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
