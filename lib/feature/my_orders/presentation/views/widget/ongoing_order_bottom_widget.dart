import 'package:bacura_app/core/utils/index.dart';

class OnGoingOrderBottomWidget extends StatelessWidget {
  Function() onPressed;

  OnGoingOrderBottomWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: AppSizes.pw36, vertical: AppSizes.ph15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
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
                  Text(AppLocalizations.of(context)!.request_management,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.whiteColor,
                            fontWeight: FontWeight.bold,
                          )),
                  Icon(
                    Icons.arrow_circle_up_outlined,
                    color: ColorManager.whiteColor,
                  )
                ])));
  }
}
