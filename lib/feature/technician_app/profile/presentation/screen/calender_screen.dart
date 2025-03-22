import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/controller/calender_orders_provider.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/screen/index.dart';

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
          builder: (context, provider, child) => provider.isLoadingMyOrders
              ? const Center(child: Center(child: CircularProgressIndicator()))
              : Column(
                  children: [
                    Expanded(child: SpCalenderWidget()),
                    Expanded(
                      child: Container(
                        color: ColorManager.midWhiteColor,
                        child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: SpCalenderRequestItemComponent(),
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
