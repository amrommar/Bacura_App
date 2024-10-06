import 'package:bacura_app/presentation/homeScreen/More_tab/more_tab.dart';
import 'package:bacura_app/presentation/homeScreen/Offers_tab/offers_tab.dart';
import 'package:bacura_app/presentation/homeScreen/Requests_tab/requests_tab.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/home_tab.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Cart_tab/cart_tab.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 3;

  List<Widget> Tabs = [
    Cart_Tab(),
    More_Tab(),
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
      appBar: AppBar(
        title: Text(appBarTitles[currentIndex]),
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w), // Add some padding for spacing
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // Ensures the row takes only necessary width
            children: [
              Flexible(
                child: IconButton(
                  icon: Icon(Icons.notifications, size: 30.w),
                  // Reduce icon size slightly
                  onPressed: () {
                    // Handle notification icon tap
                  },
                ),
              ),
              SizedBox(width: 40.w),
              Flexible(
                child: IconButton(
                  icon: Icon(Icons.message, size: 30.w),
                  // Reduce icon size slightly
                  onPressed: () {
                    // Handle message icon tap
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () {
                // Handle profile icon/image tap
              },
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.personalDetailsRoute);
                },
                child: CircleAvatar(
                  radius: 20.w, // Adjust the radius to make sure it fits

                  //_______________________________________________________________________________
                  //  backgroundImage: AssetImage('assets/images/ad12.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                label: AppStrings.more, icon: Icon(Icons.more_horiz)
                // ImageIcon(AssetImage(ImageAssets.moreIcon))
                ),
            BottomNavigationBarItem(
                label: AppStrings.cart, icon: Icon(Icons.shopping_cart_outlined)
                // ImageIcon(AssetImage(ImageAssets.cartIcon))
                ),
            BottomNavigationBarItem(
                label: AppStrings.home,
                icon: Icon(
                  Icons.home_filled,
                )
                // ImageIcon(AssetImage(ImageAssets.homeIcon),)
                ),
            BottomNavigationBarItem(
                label: AppStrings.requests,
                icon: Icon(Icons.request_quote_outlined)
                // ImageIcon(AssetImage(ImageAssets.ordersIcon),)
                ),
            BottomNavigationBarItem(
                label: AppStrings.offers, icon: Icon(Icons.local_offer_outlined)
                // ImageIcon(AssetImage(ImageAssets.offersIcon))
                ),
          ]),
      body: Tabs[currentIndex],
    );
  }
}
