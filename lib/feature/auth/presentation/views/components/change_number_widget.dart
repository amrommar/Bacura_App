import 'package:bacura_app/core/utils/index.dart';

class ChangeNumberWidget extends StatelessWidget {
  String mobileNumber;

  ChangeNumberWidget({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      //// from Back-End ////////////////////////
      Text(
        '${mobileNumber.substring(7, 9)}******${mobileNumber.substring(0, 2)}',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      SizedBox(width: AppSizes.pw10),
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          tr(AppStrings.changeMobileNumber),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: ColorManager.primaryBlueColor,
              ),
        ),
      )
    ]);
  }
}
