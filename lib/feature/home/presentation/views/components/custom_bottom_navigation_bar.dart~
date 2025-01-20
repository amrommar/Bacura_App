import 'package:bacura_app/core/utils/index.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  HomeBottomNavigationBar({super.key, required this.onTap, required this.currentIndex});

  Function(dynamic) onTap;
  int currentIndex;

  @override
  State<HomeBottomNavigationBar> createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
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
          icon: Icon(Icons.home_filled, color: ColorManager.whiteColor),
          selectedColor: ColorManager.whiteColor,
        ),

        /// requests
        SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.requests),
            icon: Icon(Icons.request_page_outlined, color: ColorManager.whiteColor),
            selectedColor: ColorManager.whiteColor),

        /// offers
        SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.offers),
            icon: Icon(Icons.local_offer_outlined, color: ColorManager.whiteColor),
            selectedColor: ColorManager.whiteColor),

        /// More
        SalomonBottomBarItem(
            title: Text(AppLocalizations.of(context)!.more),
            icon: Icon(Icons.more_horiz, color: ColorManager.whiteColor),
            selectedColor: ColorManager.whiteColor),
      ],
    );
  }
}
