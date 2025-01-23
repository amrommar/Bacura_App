import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

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
        body: Column(children: [
          const SpCalenderWidget(),
          Expanded(
              child: Container(
            color: ColorManager.midWhiteColor,
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: const SpCalenderRequestItemWidget(),
                  );
                }),
          )),
        ]));
  }
}
