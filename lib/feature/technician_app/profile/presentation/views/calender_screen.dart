import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/controller/calender_orders_provider.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/views/index.dart';

class CalenderScreen extends StatefulWidget {
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التقويم'),
        elevation: 0,
      ),
      body: ChangeNotifierProvider<CalenderOrdersProvider>(
        create: (context) => CalenderOrdersProvider(),
        child: Consumer<CalenderOrdersProvider>(
          builder: (context, provider, child) => Column(
            children: [
              Expanded(
                child: SpCalenderWidget(),
              ),
              provider.orders.length == 0
                  ? Expanded(child: Text('لا يوجد طلبات'))
                  : provider.isLoadingMyOrders
                      ? const Center(child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                          child: Container(
                            color: ColorManager.midWhiteColor,
                            child: ListView.builder(
                              itemCount: provider.orders.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: SpCalenderRequestItemComponent(
                                    index: index,
                                  ),
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
