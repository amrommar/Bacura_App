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
    ImageAssets.smartHomeIcon,
    ImageAssets.accessControlIcon,
    ImageAssets.soundSystemsIcon,
    ImageAssets.savePowerIcon,
    ImageAssets.networkIcon,
    ImageAssets.gameRepairIcon,
    ImageAssets.pcRepairIcon,
    ImageAssets.phoneRepairIcon,
  ];
  List<String> imagesTitle = [
    AppStrings.security_and_monitoring,
    AppStrings.smartSystems,
    AppStrings.accessControl,
    AppStrings.soundSystems,
    AppStrings.saveEnergy,
    AppStrings.networks_communications,
    AppStrings.gameMaintenance,
    AppStrings.computerMaintenance,
    AppStrings.phoneMaintenance,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Divider(
            color: ColorManager.lightBlueColor,
            thickness: 2,
          ),
          // Apartments List (could be GridView as well)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
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
          SizedBox(height: 5.h),
          // More Ask Section______________________________________________________
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(AppStrings.mostRequested,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.blackColor,
                    fontWeight: FontWeight.bold)),
          ),

          Divider(
            color: ColorManager.lightBlueColor,
            thickness: 2,
          ),
          Container(
            height: 180.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // Set the direction to horizontal
              itemCount: 10,
              // Replace with the number of items you want to display
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: OffersCard(), // Custom widget to show image and text
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
