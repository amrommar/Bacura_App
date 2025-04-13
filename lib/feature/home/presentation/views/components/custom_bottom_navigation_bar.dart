import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

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
    final profileProvider = Provider.of<MyProfileProvider>(context);

    return SalomonBottomBar(
      backgroundColor: ColorManager.primaryBlueColor,
      currentIndex: widget.currentIndex,
      onTap: (index) => (index == 1 && profileProvider.token == null)
          ? customShowCustomDialog(
              context: context,
              title: tr(AppStrings.login),
              imagePath: AppAssets.badFeedback,
              content: tr(AppStrings.pleaseLoginToSeeYourRequests),
              isOk: true,
              isCancel: true,
              onCancel: () {
                Navigator.pop(context);
              },
              onOk: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              },
            )
          : widget.onTap(index),
      items: [
        /// home
        SalomonBottomBarItem(
          title: Text(tr(AppStrings.home)),
          icon: Icon(
            Icons.home_filled,
            color: ColorManager.whiteColor,
            size: AppSizes.ph30,
          ),
          selectedColor: ColorManager.whiteColor,
        ),

        /// orders
        SalomonBottomBarItem(
            title: Text(tr(AppStrings.orders)),
            icon: Icon(
              Icons.request_page_outlined,
              color: ColorManager.whiteColor,
              size: AppSizes.ph30,
            ),
            selectedColor: ColorManager.whiteColor),

        /// offers
        SalomonBottomBarItem(
            title: Text(tr(AppStrings.offers)),
            icon: Icon(
              Icons.local_offer_outlined,
              color: ColorManager.whiteColor,
              size: AppSizes.ph30,
            ),
            selectedColor: ColorManager.whiteColor),

        /// More
        SalomonBottomBarItem(
            title: Text(tr(AppStrings.more)),
            icon: Icon(
              Icons.more_horiz,
              color: ColorManager.whiteColor,
              size: AppSizes.ph30,
            ),
            selectedColor: ColorManager.whiteColor),
      ],
    );
  }
}
