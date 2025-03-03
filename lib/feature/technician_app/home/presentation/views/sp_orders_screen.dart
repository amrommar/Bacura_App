import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/home/controller/sp_orders_provider.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpOrdersScreen extends StatefulWidget {
  const SpOrdersScreen({super.key});

  @override
  State<SpOrdersScreen> createState() => _SpOrdersScreenState();
}

class _SpOrdersScreenState extends State<SpOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: Text('هلا، محمد',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                  )),
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.spProfileDetailsRoute);
              },
              child: Row(children: [
                SizedBox(width: AppSizes.pw8),
                Flexible(
                    child: CircleAvatar(
                        radius: AppSizes.br24,
                        backgroundColor: ColorManager.whiteColor,
                        child: Image.asset('assets/images/Ellipse 1.png')))
              ])),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications, size: AppSizes.ph30),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notificationsRoute);
                }),
          ]),
      body: ChangeNotifierProvider(
        create: (context) => SpOrdersProvider(),
        child: Consumer<SpOrdersProvider>(
          builder: (context, provider, child) => Column(
            children: [
              /// orders section ///////////////////////////////////////////////////////
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => provider.onRefresh(),
                  child: ListView.builder(
                    itemCount: provider.myOrderEntity.myOrderDataEntity.length,
                    itemBuilder: (context, index) {
                      return SPRequestItemWidget(
                        index: index,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
