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
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw12,
          vertical: AppSizes.ph6,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw16,
          vertical: AppSizes.ph6,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(AppSizes.br12),
          color: ColorManager.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.circle : Icons.circle_outlined,
              color: isSelected ? ColorManager.primaryBlueColor : ColorManager.blackColor,
              size: AppSizes.ph30,
            ),
            Container(
              padding: EdgeInsets.only(
                top: AppSizes.ph6,
                right: AppSizes.pw8,
                left: AppSizes.pw8,
              ),
              width: AppSizes.pw338,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.blackColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
