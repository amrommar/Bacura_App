import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/home/presentation/views/home_tab_view.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/home_app_bar_leading.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/home_bottom_navigation_bar.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/home_floating_action_button.dart';
import 'package:bacura_app/feature/more/views/more_tab_view.dart';
import 'package:bacura_app/feature/notifications/presentation/views/widgets/notifications_icon.dart';
import 'package:bacura_app/feature/offers/presentation/views/offers_tab.dart';
import 'package:bacura_app/feature/requests/presetation/views/requests_tab_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> Tabs = [
    const HomeTabView(),
    Requests_Tab(),
    const Offers_Tab(),
    const More_Tab(),
  ];

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: Text(
            'هلا، محمد',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.whiteColor,
                ),
          ),
          elevation: 0,
          leading: const HomeAppBarLeading(),
          actions: const [NotificationsIcon()]),
      floatingActionButton: const HomeFloatingActionButton(),
      bottomNavigationBar: HomeBottomNavigationBar(
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        currentIndex: currentIndex,
      ),
      body: Tabs[currentIndex],
    );
  }
}
