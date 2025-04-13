import 'package:bacura_app/core/utils/index.dart';

class UserGuideContent extends StatelessWidget {
  String content;

  UserGuideContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ColorManager.blackColor,
          ),
    );
  }
}
