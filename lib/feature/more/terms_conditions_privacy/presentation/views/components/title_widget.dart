import 'package:bacura_app/core/utils/index.dart';

class TitleWidget extends StatelessWidget {
  String title;

  TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorManager.primaryBlueColor,
              fontWeight: FontWeight.bold,
            ));
  }
}
