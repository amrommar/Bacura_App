import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/service_provider/requests/presentation/views/widgets/dashed_line_pointer.dart';
import 'package:flutter/material.dart';

class ImplementRequestPhaseSection extends StatefulWidget {
  final Function(bool) onToggle;
  final String title;
  final String? time;
  final bool initialCompleted; // Initial state of completion
  final bool isLast;

  const ImplementRequestPhaseSection({
    super.key,
    required this.onToggle,
    required this.title,
    this.time,
    required this.initialCompleted,
    required this.isLast,
  });

  @override
  State<ImplementRequestPhaseSection> createState() => _ImplementRequestPhaseSectionState();
}

class _ImplementRequestPhaseSectionState extends State<ImplementRequestPhaseSection> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.initialCompleted; // Initialize the state based on initialCompleted
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
          onTap: () {
            setState(() {
              isCompleted = !isCompleted; // Toggle the completion state
              widget.onToggle(isCompleted); // Call the callback with the new state
            });
          },
          child: Column(children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? ColorManager.midBlueColor : ColorManager.lightGreyColor,
            ),
            if (!widget.isLast) ...[
              const SizedBox(height: 4.0),
              // Dashed vertical line
              SizedBox(
                  height: 40.0,
                  width: 2.0,
                  child: CustomPaint(
                      painter: DashPainter(
                    dashHeight: 4.0,
                    dashSpace: 4.0,
                    color: isCompleted ? ColorManager.primaryBlueColor : ColorManager.lightGreyColor,
                  )))
            ]
          ])),
      const SizedBox(width: 8.0),
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isCompleted ? ColorManager.primaryBlueColor : ColorManager.lightGreyColor,
              ),
        ),
        const SizedBox(width: 10.0),
        if (widget.time != null)
          Text('(${widget.time!})',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isCompleted ? ColorManager.greyColor : ColorManager.soLightWhiteColor,
                  ))
      ])
    ]);
  }
}
