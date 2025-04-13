import 'package:bacura_app/core/utils/index.dart';

Map<String, Color> statusColors = {
  "pending": ColorManager.primaryBlueColor,
  "approved": ColorManager.orangeColor,
  "confirmed": ColorManager.yellowColor,
  "completed": ColorManager.greenColor,
  "declined": ColorManager.redColor,
};
List<String> ordersTypes = [
  'pending',
  'approved',
  'completed',
  'declined',
  'confirmed',
];

String translateFilter(String filter, BuildContext context) {
  switch (filter) {
    case 'pending':
      return tr(AppStrings.pending);
    case 'approved':
      return tr(AppStrings.onGoing);
    case 'completed':
      return tr(AppStrings.completed);
    case 'declined':
      return tr(AppStrings.cancelled);
    case 'confirmed':
      return tr(AppStrings.confirmed);
    default:
      return filter;
  }
}

Color requestColor(Color currentColor) {
  if (currentColor == ColorManager.yellowColor) {
    return ColorManager.lightYellowColor;
  } else if (currentColor == ColorManager.primaryBlueColor) {
    return ColorManager.lightBlueColor;
  } else if (currentColor == ColorManager.greenColor) {
    return ColorManager.lightGreenColor;
  } else if (currentColor == ColorManager.orangeColor) {
    return ColorManager.lightOrangeColor;
  } else if (currentColor == ColorManager.redColor) {
    return ColorManager.lightRedColor;
  }
  return ColorManager.whiteColor;
}
