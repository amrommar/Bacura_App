import 'package:bacura_app/core/utils/index.dart';

class UserGuideSmallList extends StatelessWidget {
  String content;

  UserGuideSmallList({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.primaryBlueColor),
    );
  }
}
