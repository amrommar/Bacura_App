import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/card_widget.dart';
import '../../widgets/offer_card.dart';

class Home_Tab extends StatefulWidget {
  const Home_Tab({super.key});

  @override
  State<Home_Tab> createState() => _Home_TabState();
}

class _Home_TabState extends State<Home_Tab> {
  List<String> imagesPaths = [
    ImageAssets.cameraIcon,
    ImageAssets.accessControlIcon,
    ImageAssets.gameRepairIcon,
    ImageAssets.networkIcon,
    ImageAssets.pcRepairIcon,
    ImageAssets.phoneRepairIcon,
    ImageAssets.savePowerIcon,
    ImageAssets.smartHomeIcon,
    ImageAssets.soundSystemsIcon,
  ];
  List<String> imagesTitle = [
    AppStrings.camera,
    AppStrings.accessControl,
    AppStrings.gameRepair,
    AppStrings.network,
    AppStrings.pcRepair,
    AppStrings.phoneRepair,
    AppStrings.savePower,
    AppStrings.smartHome,
    AppStrings.soundSystems,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Ad Slider Section_____________________________________________________
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p20),
            child: CarouselSlider(
              items: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.ad1Image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 142.h,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 0.8,
              ),
            ),
          ),
          // Apartments Section______________________________________________________
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(AppStrings.apartments,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.blackColor,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.h),
          // Apartments List (could be GridView as well)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                // Disable scrolling inside GridView
                shrinkWrap: true,
                // Let it take only necessary height
                itemCount: 9,
                // Replace with your apartments list length
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of items per row
                  crossAxisSpacing: 0.w, // Horizontal space between items
                  mainAxisSpacing: 0.h, // Vertical space between items
                  childAspectRatio: 1, // Adjust the item height to width ratio
                ),
                itemBuilder: (context, index) {
                  return ApartmentCard(
                    apartmentTitle: imagesTitle[index],
                    imagePath: imagesPaths[index],
                  ); // Widget for each apartment card
                },
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // More Ask Section______________________________________________________
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(AppStrings.moreAsk,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.blackColor,
                    fontWeight: FontWeight.bold)),
          ),

          SizedBox(height: 10.h),
          Container(
            height: 180.h,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                // Set the direction to horizontal
                itemCount: 10,
                // Replace with the number of items you want to display
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: OffersCard(), // Custom widget to show image and text
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
