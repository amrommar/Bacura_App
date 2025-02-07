import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';
import 'package:bacura_app/feature/technician_app/requests/presentation/views/components/customer_name_widget.dart';

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
          SizedBox(height: AppSizes.ph10),

          const CustomerNameWidget(),
        ],
      )),
    );
  }
}
