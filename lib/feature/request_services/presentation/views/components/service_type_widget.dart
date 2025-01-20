import 'package:bacura_app/core/utils/index.dart';

class ServiceTypeWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onSelect;

  const ServiceTypeWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.circle : Icons.circle_outlined,
              color: isSelected ? ColorManager.primaryBlueColor : ColorManager.blackColor,
            ),
            Container(
              padding: EdgeInsets.only(top: 6.h, right: 8.w, left: 8.w),
              width: 345.w,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
