import 'package:bacura_app/core/utils/index.dart';

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
