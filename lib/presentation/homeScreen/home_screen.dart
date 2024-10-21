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

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;

  List<Widget> Tabs = [
    Home_Tab(),
    Requests_Tab(),
    Offers_Tab(),
    More_Tab(),
  ];
  List<String> appBarTitles = [
    AppStrings.home,
    AppStrings.requests,
    AppStrings.offers,
    AppStrings.more,
  ];

  var formKey = GlobalKey<FormState>();
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        titleSpacing: 5,
        centerTitle: false,
        title: Text('Hi, Mohamed',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManager.whiteColor)),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.personalDetailsRoute);
            },
            child: Row(children: [
              SizedBox(width: 8.w),
              Flexible(
                  child: CircleAvatar(
                      radius: 23.w,
                      backgroundColor: ColorManager.whiteColor,
                      child: Image.asset(
                          'assets/images/Ellipse 1.png') // Adjust the radius to make sure it fits
                      ))
            ])),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.message, size: 30.h),
          //   // Reduce icon size slightly
          //   onPressed: () {
          //     // Handle message icon tap
          //   },
          // ),
          IconButton(
              icon: Icon(Icons.notifications, size: 30.h),
              // Reduce icon size slightly
              onPressed: () {
                Navigator.pushNamed(context, Routes.notificationsRoute);
                // Handle notification icon tap
              })
        ],
      ),
      floatingActionButton: AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          // Animation duration
          curve: Curves.easeInOut,
          // Smooth animation
          bottom: 16.0,
          // Keep it at the bottom
          left: isFocused ? MediaQuery.of(context).size.width - 80 : -40,
          // Move from half-visible to fully-visible
          child: AnimatedOpacity(
              opacity: isFocused ? 1.0 : 0.5,
              // Initially half-transparent, fully visible when clicked
              duration: Duration(milliseconds: 500),
              // Match opacity animation with movement
              child: FloatingActionButton(
                  onPressed: () {
                    if (!isFocused) {
                      // If button is not focused, just make it move to right and be fully visible
                      setState(() {
                        isFocused = true;
                      });
                    } else {
                      Navigator.pushNamed(context, Routes.customerServiceRoute);
                      // If button is already focused, navigate to customer service
                    }
                  },
                  child: Icon(Icons.headset_mic_outlined,
                      color: ColorManager.whiteColor, size: 40),
                  backgroundColor: ColorManager.primaryBlueColor))),
      // Container(
      //     margin: EdgeInsets.symmetric(
      //         horizontal: AppMargin.m10, vertical: AppMargin.m20),
      //     child: FloatingActionButton(
      //         elevation: 5,
      //         shape: CircleBorder(),
      //         focusColor: ColorManager.lightBlueColor,
      //         backgroundColor: ColorManager.primaryBlueColor,
      //         onPressed: () {
      //           Navigator.pushNamed(context, Routes.customerServiceRoute);
      //         },
      //         child: Icon(
      //           Icons.headset_mic_outlined,
      //           color: ColorManager.whiteColor,
      //           size: 40, // Icon color inside the FAB
      //         ))),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: ColorManager.primaryBlueColor,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          /// home
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

          /// More
          SalomonBottomBarItem(
              title: Text(AppStrings.more),
              icon: Icon(Icons.more_horiz, color: ColorManager.whiteColor),
              selectedColor: ColorManager.whiteColor),
        ],
      ),
      body: Tabs[currentIndex],
    );
  }
}
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
