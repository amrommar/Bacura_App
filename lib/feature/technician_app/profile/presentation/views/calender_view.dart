import 'package:bacura_app/core/utils/index.dart';

class CalenderView extends StatefulWidget {
  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('التقويم'),
          elevation: 0,
        ),
        body: const CalenderViewBody());
  }
}
