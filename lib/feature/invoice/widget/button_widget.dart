import 'package:bacura_app/core/utils/index.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: AppSizes.ph22,
            color: ColorManager.whiteColor,
          ),
        ),
        onPressed: onClicked,
      );
}
