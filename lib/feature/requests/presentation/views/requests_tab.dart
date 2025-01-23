import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/requests/index.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key});

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
  List<Color> colors = [
    ColorManager.yellowColor,
    ColorManager.primaryBlueColor,
    ColorManager.greenColor,
    ColorManager.redColor,
    ColorManager.yellowColor,
    ColorManager.primaryBlueColor,
    ColorManager.greenColor,
    ColorManager.redColor,
    ColorManager.yellowColor,
    ColorManager.primaryBlueColor,
    ColorManager.greenColor,
    ColorManager.redColor
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 5.h),

      /// filtering section ///////////////////////////////////////////////////////
      const RequestsFilterWidget(),
      Divider(color: ColorManager.lightBlueColor),

      /// Requests section ///////////////////////////////////////////////////////

      Expanded(
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.requestDetailsRoute);
                    },
                    child: RequestDetailsWidget(
                      backgroundColor: requestColor(colors[index]),
                      requestColor: colors[index],
                    ));
              }))
    ]);
  }

  Color requestColor(Color currentColor) {
    if (currentColor == ColorManager.yellowColor) {
      return ColorManager.lightYellowColor;
    } else if (currentColor == ColorManager.primaryBlueColor) {
      return ColorManager.lightBlueColor;
    } else if (currentColor == ColorManager.greenColor) {
      return ColorManager.lightGreenColor;
    } else if (currentColor == ColorManager.redColor) {
      return ColorManager.lightRedColor;
    }
    return ColorManager.whiteColor;
  }
}
