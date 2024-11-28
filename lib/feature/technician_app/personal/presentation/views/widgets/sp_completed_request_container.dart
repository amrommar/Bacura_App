import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/technician_app/personal/presentation/views/widgets/sp_completed_request_time_num_row.dart';
import 'package:bacura_app/feature/technician_app/requests/presentation/views/widgets/customer_name_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../personal/presentation/views/widgets/custom_container.dart';

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
      child: CustomShadowContainer(
          childWidget: Column(
        children: [
          ////Time and Date section/////////////////////////////////////////////
          const SpCompletedRequestTimeNumRow(),
          const Divider(),
          SizedBox(height: 10.h),

          const CustomerNameRow(),
        ],
      )),
    );
  }
}
