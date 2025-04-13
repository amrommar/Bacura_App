import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/request_details_price_widget.dart';

class ServiceDetailsList extends StatelessWidget {
  const ServiceDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.ph15),
      decoration: BoxDecoration(
        color: ColorManager.soLightWhiteColor,
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
            color: ColorManager.lightBlueColor,
          );
        },
        itemCount: 4,
      ),
    );
  }
}
