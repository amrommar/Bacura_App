import 'package:bacura_app/core/utils/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> Tabs = [
    const HomeTab(),
    RequestsTab(),
    const OffersTab(),
    const MoreTab(),
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
          leading: const AppBarProfileImageWidget(),
          actions: const [NotificationsIconWidget()]),
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
