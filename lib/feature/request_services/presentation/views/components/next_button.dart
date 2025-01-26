import 'package:bacura_app/core/utils/index.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onPressed; // Nullable to handle disabled state
  final bool isEnabled;

  const NextButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          maximumSize: Size(170.w, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.br8),
          ),
          backgroundColor: isEnabled
              ? ColorManager.primaryBlueColor
              : ColorManager.lightGreyColor, // Change color based on enabled state
        ),
        onPressed: isEnabled ? onPressed : null, // Disable button if not enabled
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.next,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorManager.whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10.w),
            Icon(Icons.arrow_circle_right_outlined, color: ColorManager.whiteColor),
          ],
        ),
      ),
    );
  }
}
