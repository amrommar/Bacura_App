import 'package:bacura_app/core/utils/index.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTap, required this.currentIndex});

  final Function(dynamic) onTap;
  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      backgroundColor: ColorManager.primaryBlueColor,
      currentIndex: widget.currentIndex,
      onTap: (index) => widget.onTap(index),
      items: [
        /// home
        SalomonBottomBarItem(
          title: Text(AppLocalizations.of(context)!.home),
          icon: Icon(Icons.home_filled, color: ColorManager.whiteColor, size: AppSizes.ph30),
          selectedColor: ColorManager.whiteColor,
        ),

        /// orders
        SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.orders),
            icon: Icon(Icons.request_page_outlined, color: ColorManager.whiteColor, size: AppSizes.ph30),
            selectedColor: ColorManager.whiteColor),

        /// offers
        SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.offers),
            icon: Icon(Icons.local_offer_outlined, color: ColorManager.whiteColor, size: AppSizes.ph30),
            selectedColor: ColorManager.whiteColor),

        /// More
        SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.more),
            icon: Icon(Icons.more_horiz, color: ColorManager.whiteColor, size: AppSizes.ph30),
            selectedColor: ColorManager.whiteColor),
      ],
    );
  }
}
