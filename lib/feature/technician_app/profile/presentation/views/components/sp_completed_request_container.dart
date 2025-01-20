import 'package:bacura_app/core/utils/index.dart';

class SpCompletedRequestContainer extends StatefulWidget {
  const SpCompletedRequestContainer({super.key});

  @override
  State<SpCompletedRequestContainer> createState() => _SpCompletedRequestContainerState();
}

class _SpCompletedRequestContainerState extends State<SpCompletedRequestContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.spRequestDetailsRoute);
      },
      child: CustomShadowWidget(
          childWidget: Column(
        children: [
          ////Time and Date section/////////////////////////////////////////////
          const SpCompletedRequestTimeNumRow(),
          const Divider(),
          SizedBox(height: 10.h),

          const CustomerNameWidget(),
        ],
      )),
    );
  }
}
