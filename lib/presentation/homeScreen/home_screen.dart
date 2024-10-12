import 'package:bacura_app/presentation/homeScreen/More_tab/more_tab.dart';
import 'package:bacura_app/presentation/homeScreen/Offers_tab/offers_tab.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/requests_tab.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/home_tab.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../resources/values_manager.dart';
import 'Cart_tab/cart_tab.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;

  List<Widget> Tabs = [
    More_Tab(),
    Cart_Tab(),
    Home_Tab(),
    Requests_Tab(),
    Offers_Tab(),
  ];
  List<String> appBarTitles = [
    AppStrings.more,
    AppStrings.cart,
    AppStrings.home,
    AppStrings.requests,
    AppStrings.offers,
  ];

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        titleSpacing: 5,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hi Mohamed',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ColorManager.whiteColor, fontSize: 13)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: ColorManager.whiteColor,
                  size: 14,
                ),
                SizedBox(width: 2.w),
                Text('1000 SR',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.whiteColor, fontSize: 13)),
                SizedBox(width: 2.w),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorManager.whiteColor,
                  size: 14,
                ),
              ],
            )
          ],
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.personalDetailsRoute);
          },
          child: Row(
            children: [
              SizedBox(width: 8.w),
              Flexible(
                child: CircleAvatar(
                  radius: 22.w,
                  backgroundColor: ColorManager.whiteColor,
                  child: Image.asset(
                      'assets/images/Ellipse 1.png'), // Adjust the radius to make sure it fits
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // Ensures the row takes only necessary width
            children: [
              IconButton(
                icon: Icon(Icons.message, size: 30.h),
                // Reduce icon size slightly
                onPressed: () {
                  // Handle message icon tap
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications, size: 30.h),
                // Reduce icon size slightly
                onPressed: () {
                  // Handle notification icon tap
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m10, vertical: AppMargin.m20),
        child: FloatingActionButton(
          elevation: 5,
          shape: CircleBorder(),
          focusColor: ColorManager.lightBlueColor,
          backgroundColor: ColorManager.primaryBlueColor,
          onPressed: () {},
          child: Icon(
            Icons.headset_mic_outlined,
            color: ColorManager.whiteColor,
            size: 40, // Icon color inside the FAB
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: ColorManager.primaryBlueColor,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          /// More
          SalomonBottomBarItem(
              title: Text(AppStrings.more),
              icon: Icon(Icons.more_horiz, color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),

          /// Cart
          SalomonBottomBarItem(
              title: Text(AppStrings.cart),
              icon: Icon(Icons.shopping_cart_outlined,
                  color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),

          /// Cart
          SalomonBottomBarItem(
            title: Text(AppStrings.home),
            icon: Icon(Icons.home_filled, color: ColorManager.whiteColor),
            selectedColor: ColorManager.whiteColor,
          ),

          /// requests
          SalomonBottomBarItem(
              title: Text(AppStrings.requests),
              icon: Icon(Icons.request_page_outlined,
                  color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),

          /// offers
          SalomonBottomBarItem(
              title: Text(AppStrings.offers),
              icon: Icon(Icons.local_offer_outlined,
                  color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),
        ],
      )
      // BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: currentIndex,
      //     onTap: (index) {
      //       currentIndex = index;
      //       setState(() {});
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //           label: AppStrings.more,
      //           icon: Icon(
      //             Icons.more_horiz,
      //           )
      //           // ImageIcon(AssetImage(ImageAssets.moreIcon))
      //           ),
      //       BottomNavigationBarItem(
      //           label: AppStrings.cart, icon: Icon(Icons.shopping_cart_outlined)
      //           // ImageIcon(AssetImage(ImageAssets.cartIcon))
      //           ),
      //       BottomNavigationBarItem(
      //           label: AppStrings.home, icon: Icon(Icons.home_filled)
      //           // ImageIcon(AssetImage(ImageAssets.homeIcon),)
      //           ),
      //       BottomNavigationBarItem(
      //           label: AppStrings.requests,
      //           icon: Icon(Icons.request_quote_outlined)
      //           // ImageIcon(AssetImage(ImageAssets.ordersIcon),)
      //           ),
      //       BottomNavigationBarItem(
      //           label: AppStrings.offers, icon: Icon(Icons.local_offer_outlined)
      //           // ImageIcon(AssetImage(ImageAssets.offersIcon))
      //           ),
      //     ]),
      ,
      body: Tabs[currentIndex],
    );
  }
}

/// app english
///AppBar(
//         title: Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Hi Mohamed',
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleSmall!
//                       .copyWith(color: ColorManager.whiteColor, fontSize: 13)),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.keyboard_arrow_down,
//                     color: ColorManager.whiteColor,
//                     size: 14,
//                   ),
//                   SizedBox(width: 2.w),
//                   Text('1000 SR',
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           color: ColorManager.whiteColor, fontSize: 13)),
//                   SizedBox(width: 2.w),
//                   Icon(
//                     Icons.account_balance_wallet_outlined,
//                     color: ColorManager.whiteColor,
//                     size: 14,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         elevation: 0,
//         leading: Padding(
//           padding: EdgeInsets.only(right: 10.w),
//           child: InkWell(
//             onTap: () {
//               Navigator.pushNamed(context, Routes.personalDetailsRoute);
//             },
//             child: Row(
//               children: [
//                 SizedBox(width: 4.w),
//                 CircleAvatar(
//                   radius: 22.w,
//                   backgroundColor: ColorManager.whiteColor,
//                   child: Image.asset(
//                       'assets/images/Ellipse 1.png'), // Adjust the radius to make sure it fits
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             // Add some padding for spacing
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               // Ensures the row takes only necessary width
//               children: [
//                 Flexible(
//                   child: IconButton(
//                     icon: Icon(Icons.notifications, size: 30.w),
//                     // Reduce icon size slightly
//                     onPressed: () {
//                       // Handle notification icon tap
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 40.w),
//                 Flexible(
//                   child: IconButton(
//                     icon: Icon(Icons.message, size: 30.w),
//                     // Reduce icon size slightly
//                     onPressed: () {
//                       // Handle message icon tap
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )
///appbar arabic//////////////////////////////////////////////////////////////////////////////
///AppBar(
//         elevation: 0,
//         leading: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.w),
//           // Add some padding for spacing
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             // Ensures the row takes only necessary width
//             children: [
//               Flexible(
//                 child: IconButton(
//                   icon: Icon(Icons.notifications, size: 30.w),
//                   // Reduce icon size slightly
//                   onPressed: () {
//                     // Handle notification icon tap
//                   },
//                 ),
//               ),
//               SizedBox(width: 40.w),
//               Flexible(
//                 child: IconButton(
//                   icon: Icon(Icons.message, size: 30.w),
//                   // Reduce icon size slightly
//                   onPressed: () {
//                     // Handle message icon tap
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 10.w),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, Routes.personalDetailsRoute);
//               },
//               child: Row(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text('Hi Mohamed',
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleSmall!
//                               .copyWith(
//                                   color: ColorManager.whiteColor,
//                                   fontSize: 13)),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.keyboard_arrow_down,
//                             color: ColorManager.whiteColor,
//                             size: 14,
//                           ),
//                           SizedBox(width: 2.w),
//                           Text('1000 SR',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall!
//                                   .copyWith(
//                                       color: ColorManager.whiteColor,
//                                       fontSize: 13)),
//                           SizedBox(width: 2.w),
//                           Icon(
//                             Icons.account_balance_wallet_outlined,
//                             color: ColorManager.whiteColor,
//                             size: 14,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   CircleAvatar(
//                     radius: 22.w,
//                     backgroundColor: ColorManager.whiteColor,
//                     child: Image.asset(
//                         'assets/images/Ellipse 1.png'), // Adjust the radius to make sure it fits
//
//                     //_______________________________________________________________________________
//                     //  backgroundImage: AssetImage('assets/images/ad12.png'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       )
class CustomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveHeight = 40;

    // Start at the bottom left
    path.lineTo(0, 0);

    // Move across to bottom-right with curve in the middle
    path.lineTo(size.width * 0.25, 0);
    path.quadraticBezierTo(
        size.width * 0.35, curveHeight, size.width * 0.5, curveHeight);
    path.quadraticBezierTo(
        size.width * 0.65, curveHeight, size.width * 0.75, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
