import 'package:bacura_app/core/utils/index.dart';

class RequestComponentsList extends StatelessWidget {
  const RequestComponentsList({super.key});

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
          return const RequestDetailsPriceWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: ColorManager.whiteColor,
          );
        },
        itemCount: 4,
      ),
    );
  }
}
