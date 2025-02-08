import 'package:bacura_app/core/utils/index.dart';

Map<String, Color> statusColors = {
  "pending": ColorManager.primaryBlueColor,
  "ongoing": ColorManager.yellowColor,
  "completed": ColorManager.greenColor,
  "canceled": ColorManager.redColor,
};
List<String> ordersTypes = [
  'pending', // سيتم عرضه بالعربي
  'ongoing',
  'completed',
  'canceled',
];
String translateFilter(String filter, BuildContext context) {
  switch (filter) {
    case 'pending':
      return AppLocalizations.of(context)!.pending;
    case 'ongoing':
      return AppLocalizations.of(context)!.on_going;
    case 'completed':
      return AppLocalizations.of(context)!.completed;
    case 'canceled':
      return AppLocalizations.of(context)!.canceled;
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
    } else if (currentColor == ColorManager.redColor) {
      return ColorManager.lightRedColor;
    }
    return ColorManager.whiteColor;
  }