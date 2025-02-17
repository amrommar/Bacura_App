import 'package:bacura_app/core/providers/core_provider.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> Tabs = [
    const HomeTabScreen(),
    const OrdersTabScreen(),
    const OffersTabScreen(),
    const MoreTabScreen(),
  ];

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<MyProfileProvider>(context);
    profileProvider.loadToken();

    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: profileProvider.token == null
              ? null
              : Text(
                  'هلا، ${profileProvider.myProfileEntity.name!}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.whiteColor,
                      ),
                ),
          elevation: 0,
          leading: const AppBarProfileImageWidget(
            imagePath:
                // profileProvider.myProfileEntity.image ??
                AppAssets.bacuraImage,
          ),
          actions: [
            const NotificationsIconWidget(),
            SizedBox(
              width: AppSizes.pw5,
            ),
          ]),
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        currentIndex: currentIndex,
      ),
      body: Tabs[currentIndex],
    );
  }
}
