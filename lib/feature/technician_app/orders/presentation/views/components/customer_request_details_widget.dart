import 'package:bacura_app/core/utils/index.dart';

class CustomerRequestDetailsWidget extends StatelessWidget {
  const CustomerRequestDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.ph15),
      margin: EdgeInsets.symmetric(vertical: AppSizes.ph12),
      decoration: BoxDecoration(
        color: ColorManager.lightBlueColor,
        borderRadius: BorderRadius.circular(AppSizes.br8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Expanded(
              child: Text('كاميرا IP خارجية 8MP 80m - كاميرا IP خارجية Hikvision 8MP 80m',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.blackColor,
                      )));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: ColorManager.whiteColor,
          );
        },
        itemCount: 2,
      ),
    );
  }
}
