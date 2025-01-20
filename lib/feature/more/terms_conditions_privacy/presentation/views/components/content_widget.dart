import 'package:bacura_app/core/utils/index.dart';

class ContentWidget extends StatelessWidget {
  String content;

  ContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: ColorManager.blackColor,
          ),
      maxLines: null, // Allows unlimited lines
      textAlign: TextAlign.justify,
      overflow: TextOverflow.visible, // Ensure text doesn't get clipped
    );
  }
}
