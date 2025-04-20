import 'package:bacura_app/core/utils/index.dart';

class PendingOrderBottomWidget extends StatelessWidget {
  Function() onPressed;

  PendingOrderBottomWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.pw36,
        vertical: AppSizes.ph15,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(AppSizes.ph200, AppSizes.ph50),
              maximumSize: Size(AppSizes.ph200, AppSizes.ph50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                AppSizes.br30,
              ))),
          onPressed: () {
            onPressed();
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr(AppStrings.manageOrder),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.whiteColor,
                          fontWeight: FontWeight.bold,
                        )),
                Icon(
                  Icons.arrow_circle_up_outlined,
                  size: AppSizes.ph30,
                  color: ColorManager.whiteColor,
                )
              ])),
    );
  }
}
