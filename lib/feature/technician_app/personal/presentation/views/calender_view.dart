import 'package:bacura_app/feature/technician_app/personal/presentation/views/widgets/calender_view_body.dart';
import 'package:flutter/material.dart';

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
