import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class ImplementRequestPhaseSection extends StatefulWidget {
  final String title;
  final String? time;
  final bool initialCompleted;
  final bool isLast;

  const ImplementRequestPhaseSection({
    super.key,
    required this.title,
    this.time,
    required this.initialCompleted,
    required this.isLast,
  });

  @override
  ImplementRequestPhaseSectionState createState() => ImplementRequestPhaseSectionState();
}

class ImplementRequestPhaseSectionState extends State<ImplementRequestPhaseSection> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.initialCompleted;
  }

  void setCompleted(bool completed) {
    setState(() {
      isCompleted = completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? ColorManager.midBlueColor : ColorManager.lightGreyColor,
            ),
            if (!widget.isLast) ...[
              SizedBox(height: AppSizes.ph4),
              SizedBox(
                height: AppSizes.ph40,
                width: AppSizes.pw2,
                child: CustomPaint(
                  painter: DashPainter(
                    dashHeight: AppSizes.ph4,
                    dashSpace: AppSizes.ph4,
                    color: isCompleted ? ColorManager.primaryBlueColor : ColorManager.lightGreyColor,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: isCompleted ? ColorManager.primaryBlueColor : ColorManager.lightGreyColor,
                  ),
            ),
            if (widget.time != null)
              Text(
                '(${widget.time!})',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isCompleted ? ColorManager.greyColor : ColorManager.soLightWhiteColor,
                    ),
              ),
          ],
        ),
      ],
    );
  }
}
