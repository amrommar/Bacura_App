import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/service_provider/personal/presentation/views/widgets/sp_calender.dart';
import 'package:bacura_app/feature/service_provider/personal/presentation/views/widgets/sp_calender_request_container.dart';
import 'package:flutter/material.dart';

class CalenderViewBody extends StatefulWidget {
  const CalenderViewBody({super.key});

  @override
  State<CalenderViewBody> createState() => _CalenderViewBodyState();
}

class _CalenderViewBodyState extends State<CalenderViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SpCalender(),
      Expanded(
          child: Container(
        color: ColorManager.midWhiteColor,
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: const SpCalenderRequestContainer(),
              );
            }),
      )),
    ]);
  }
}
